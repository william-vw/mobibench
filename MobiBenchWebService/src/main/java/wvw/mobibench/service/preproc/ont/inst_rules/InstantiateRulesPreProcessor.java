/**
* Copyright 2016 William Van Woensel

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
* 
* 
* @author wvw
* 
*/

package wvw.mobibench.service.preproc.ont.inst_rules;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.topbraid.spin.arq.ARQ2SPIN;
import org.topbraid.spin.arq.ARQFactory;
import org.topbraid.spin.model.Construct;
import org.topbraid.spin.model.Element;
import org.topbraid.spin.model.Filter;
import org.topbraid.spin.model.FunctionCall;
import org.topbraid.spin.model.TriplePattern;
import org.topbraid.spin.model.TripleTemplate;
import org.topbraid.spin.model.Variable;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.jena.SPIN2Jena;
import wvw.mobibench.service.preproc.PreProcessConfig;
import wvw.mobibench.service.preproc.PreProcessConfig.Ontology;
import wvw.mobibench.service.preproc.PreProcessException;
import wvw.mobibench.service.preproc.PreProcessResults;
import wvw.mobibench.service.preproc.PreProcessTypes;
import wvw.mobibench.service.preproc.ont.OntologyBasedPreProcessor;
import wvw.mobibench.service.res.ServiceResources;
import wvw.utils.log2.Log;
import wvw.utils.rdf.RdfGen;
import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.RulesUtils;
import wvw.utils.rule.build.RuleBuilder;
import wvw.utils.rule.build.SpinRuleBuilder;

public class InstantiateRulesPreProcessor extends OntologyBasedPreProcessor {

	private List<String> instableRules = new ArrayList<String>();
	private List<String> supportRules = new ArrayList<String>();

	private Map<String, Handler> idMap = new HashMap<String, Handler>();

	public InstantiateRulesPreProcessor(ServiceResources res) {
		super(res);

		try {
			loadIds("instable-rules.spin", instableRules);

			loadIds("support-rules.spin", supportRules);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void loadIds(String name, List<String> list) throws IOException {
		List<RuleWrapper> rules = loadRules(name);

		for (RuleWrapper rule : rules)
			list.add(rule.getComment());
	}

	private String loadRulesAsString(String name) throws IOException {
		List<RuleWrapper> rules = loadRules(name);
		SPIN2Jena conv = new SPIN2Jena();
		
		StringBuffer str = new StringBuffer();
		for (RuleWrapper rule : rules) {
			String ruleStr = rule.getRule();
			try {
				ruleStr = (String) conv.convertRule(ruleStr).get(0);
				
			} catch (ConvertException e) {
				e.printStackTrace();
			}
			
			str.append(ruleStr).append("\n");
		}
		
		return str.toString();
	}

	private List<RuleWrapper> loadRules(String name) throws IOException {
		return RulesUtils.splitRules(res.getContents(rootPath + "inst_rules/" + name));
	}

	public PreProcessResults doPreprocess(PreProcessConfig config) throws PreProcessException {
		Ontology ontology = config.getOntology();

		try {
			// require hasMember inferences for instantiating some rules (e.g.,
			// #cls-int2, #cls-uni)
			Model m = loadInfModel(ontology.getContent(), ontology.getSyntax(),
					loadRulesAsString("support-rules.spin"));
			initMap();

			List<RuleWrapper> rules = config.getRuleObjs();
			// TODO for now, add special n-ary rules here
			rules.addAll(loadRules("n-ary-rules.spin"));

			// Log.d("rules: " + rules);

			List<RuleWrapper> processed = new ArrayList<RuleWrapper>();

			Iterator<RuleWrapper> ruleIt = rules.iterator();
			while (ruleIt.hasNext()) {
				RuleWrapper rule = ruleIt.next();

				if (instableRules.contains(rule.getComment())) {
					ruleIt.remove();

					Handler handler = idMap.get(rule.getComment());
					if (handler == null)
						handler = idMap.get(null);

					List<RuleWrapper> ret = preprocess(rule, handler, m);
					processed.addAll(ret);

				} else if (supportRules.contains(rule.getComment()))
					ruleIt.remove();
			}

			// Log.d("retained: " + rules);
			// Log.d("added: " + processed);

			rules.addAll(processed);
			// Log.d("final: " + rules);

			String rulesStr = RulesUtils.mergeRules(rules);

			return new PreProcessResults(rulesStr);

		} catch (IOException e) {
			throw new PreProcessException(e);
		}
	}

	public PreProcessTypes getType() {
		return PreProcessTypes.INST_RULES;
	}

	private List<RuleWrapper> preprocess(RuleWrapper rule, Handler handler, Model m) {
		List<RuleWrapper> ret = new ArrayList<RuleWrapper>();

		int idx = 0;
		String query = handler.getQuery(rule, m);
		Log.d("query: " + query);

		ResultSet res = QueryExecutionFactory.create(query, m).execSelect();
		while (res.hasNext()) {
			QuerySolution sol = res.next();

			RuleWrapper r = handler.instantiate(sol, idx++);
			Log.d("r: " + r);
			ret.add(r);
		}
		Log.d("");

		return ret;
	}

	private void initMap() {
		idMap.put("# cls-int1", new IntersectionHandler());
		idMap.put("# prp-spo2", new PropertyChainHandler());
		idMap.put("# prp-key", new HasKeyHandler());

		idMap.put(null, new DefaultHandler());
	}

	private abstract class Handler {

		protected Model m;

		protected RuleWrapper rule;
		protected RuleBuilder ret;

		protected Construct query;

		protected List<TripleTemplate> head;
		protected List<Element> body;

		public String getQuery(RuleWrapper rule, Model m) {
			setup(rule, m);

			return getQuery();
		}

		protected void setup(RuleWrapper rule, Model m) {
			this.rule = rule;
			this.m = m;

			query = toConstruct(rule.getRule(), m);

			head = query.getTemplates();
			body = query.getWhereElements();
		}

		private String getQuery() {
			return "SELECT * WHERE { " + getWhere() + "}";
		}

		protected abstract String getWhere();

		public RuleWrapper instantiate(QuerySolution sol, int idx) {
			setup(sol, idx);

			return doInstantiate(sol, idx);
		}

		protected void setup(QuerySolution sol, int idx) {
			this.ret = toRuleBuilder(rule, idx);
		}

		protected abstract RuleWrapper doInstantiate(QuerySolution sol, int idx);

		protected Construct toConstruct(String constructQuery, Model m) {
			Query arqQuery = ARQFactory.get().createQuery(m, constructQuery);

			ARQ2SPIN arq2SPIN = new ARQ2SPIN(m);
			Construct spinQuery = (Construct) arq2SPIN.createQuery(arqQuery, null);

			return spinQuery;
		}

		protected RuleBuilder toRuleBuilder(RuleWrapper rule, int idx) {
			return new SpinRuleBuilder(rule.getComment().substring(2) + "-" + idx);
		}

		protected RuleWrapper toRuleWrapper(RuleBuilder r) {
			return new RuleWrapper("# " + r.getId(), r.toString());
		}

		protected String toNTriple(TriplePattern tp) {
			return RdfGen.nTriple(tp.getSubject(), tp.getPredicate(), tp.getObject());
		}
	}

	private class DefaultHandler extends Handler {

		private int start = 0;
		private Map<String, RDFNode> map = new HashMap<String, RDFNode>();

		public void setup(RuleWrapper rule, Model m) {
			super.setup(rule, m);

			map.clear();
		}

		protected String getWhere() {
			StringBuilder where = new StringBuilder();

			for (int i = 0; i < body.size(); i++) {
				Element el = body.get(i);

				if (el instanceof TriplePattern) {
					TriplePattern tp = (TriplePattern) el;

					// @formatter:off
					if ((tp.getSubject() instanceof Variable) && 
						(tp.getObject() instanceof Variable) && 
							(tp.getPredicate().equals(type) || 
							tp.getPredicate() instanceof Variable)) {
					// @formatter:on

						start = i;

						break;

					} else
						where.append(toNTriple(tp));

				} else {
					where.append(el.toString());

					start = i + 1;
					break;
				}
			}

			return where.toString();
		}

		protected RuleWrapper doInstantiate(QuerySolution sol, int idx) {
			mapVars(sol);

			for (int i = start; i < body.size(); i++) {
				Element el = body.get(i);

				instantiateBody(el);
			}

			for (int i = 0; i < head.size(); i++)
				instantiateHead((TripleTemplate) head.get(i));

			return toRuleWrapper(ret);
		}

		private void mapVars(QuerySolution sol) {
			Iterator<String> vars = sol.varNames();

			while (vars.hasNext()) {
				String var = vars.next();

				map.put(var, sol.get(var));
			}
		}

		private void instantiateBody(Element el) {
			if (el instanceof TriplePattern)
				instantiateBody((TriplePattern) el);

			else if (el instanceof Filter)
				instantiateBody((Filter) el);
		}

		private void instantiateBody(TriplePattern tp) {
			RDFNode[] inst = instantiate(tp);

			ret.appendCondition(RdfGen.nTriple((Resource) inst[0], (Resource) inst[1], inst[2]));
		}

		private void instantiateBody(Filter f) {
			RDFNode e = f.getExpression();

			if (e instanceof FunctionCall) {
				FunctionCall fc = (FunctionCall) e;

				Resource fn = fc.getFunction();
				List<RDFNode> args = fc.getArguments();

				if (fn.equals(ne)) {
					ret.appendCondition("FILTER (" + args.get(0) + " != " + args.get(1) + ") .\n");

				} else
					Log.e("ERROR: unexpected function call: " + fn);
			}
		}

		private void instantiateHead(TripleTemplate tp) {
			RDFNode[] inst = instantiate(tp);

			ret.appendTemplate(RdfGen.nTriple((Resource) inst[0], (Resource) inst[1], inst[2]));
		}

		private RDFNode[] instantiate(TriplePattern tp) {
			RDFNode[] inst = new RDFNode[3];

			instantiate(tp.getSubject(), 0, inst);
			instantiate(tp.getPredicate(), 1, inst);
			instantiate(tp.getObject(), 2, inst);

			return inst;
		}

		private RDFNode[] instantiate(TripleTemplate tp) {
			RDFNode[] inst = new RDFNode[3];

			instantiate(tp.getSubject(), 0, inst);
			instantiate(tp.getPredicate(), 1, inst);
			instantiate(tp.getObject(), 2, inst);

			return inst;
		}

		private void instantiate(RDFNode node, int spo, RDFNode[] inst) {
			if (node instanceof Variable) {
				Variable v = (Variable) node;

				if (map.containsKey(v.getName())) {
					inst[spo] = map.get(v.getName());

					return;
				}
			}

			inst[spo] = node;
		}
	}

	private abstract class NaryHandler extends Handler {

		protected Resource subj;
		protected List<Resource> chain;

		protected TripleTemplate conseq;

		private String subjVar;
		private String propUri;
		private String listVar;

		public NaryHandler(String subjVar, String propUri, String listVar) {
			this.subjVar = subjVar;
			this.propUri = propUri;
			this.listVar = listVar;
		}

		protected void setup(QuerySolution sol, int idx) {
			super.setup(sol, idx);

			this.subj = sol.getResource(subjVar);

			Resource list0 = sol.getResource(listVar);
			this.chain = collectChain(list0, m);

			this.conseq = head.get(0);
		}

		protected String getWhere() {
			return RdfGen.nTriple("?" + subjVar, "<" + propUri + ">", "?" + listVar);
		}
	}

	private class IntersectionHandler extends NaryHandler {

		public IntersectionHandler() {
			super("c", intersectionOf.getURI(), "l1");
		}

		protected RuleWrapper doInstantiate(QuerySolution sol, int idx) {
			Resource var = conseq.getSubject();
			ret.appendTemplate(RdfGen.nTriple(var, type, subj));

			for (int j = 0; j < chain.size(); j++) {
				Resource list = chain.get(j);

				Resource el = list.getPropertyResourceValue(first);
				ret.appendCondition(RdfGen.nTriple(var, type, el));
			}

			return toRuleWrapper(ret);
		}
	}

	private class PropertyChainHandler extends NaryHandler {

		public PropertyChainHandler() {
			super("p", propertyChainAxiom.getURI(), "l1");
		}

		protected RuleWrapper doInstantiate(QuerySolution sol, int idx) {
			Resource var = conseq.getSubject();

			String prevVar = var.toString(), curVar = null;
			for (int j = 0; j < chain.size(); j++) {

				Resource list = chain.get(j);
				curVar = "?u" + (j + 2);

				Resource el = list.getPropertyResourceValue(first);
				ret.appendCondition(RdfGen.nTriple(prevVar, "<" + el.getURI() + ">", curVar));

				prevVar = curVar;
			}

			ret.appendTemplate(RdfGen.nTriple(var.toString(), "<" + subj.getURI() + ">", curVar));

			return toRuleWrapper(ret);
		}
	}

	private class HasKeyHandler extends NaryHandler {

		public HasKeyHandler() {
			super("c", hasKey.getURI(), "l1");
		}

		protected RuleWrapper doInstantiate(QuerySolution sol, int idx) {
			Resource var1 = conseq.getSubject();
			Resource var2 = (Resource) conseq.getObject();

			String var1Str = var1.toString();
			String var2Str = var2.toString();

			ret.appendTemplate(RdfGen.nTriple(var1, sameAs, var2));

			ret.appendCondition(RdfGen.nTriple(var1, type, subj));
			ret.appendCondition(RdfGen.nTriple(var2, type, subj));

			for (int j = 0; j < chain.size(); j++) {
				Resource list = chain.get(j);
				String curVar = "?z" + j;

				Resource el = list.getPropertyResourceValue(first);

				ret.appendCondition(RdfGen.nTriple(var1Str, "<" + el.getURI() + ">", curVar));
				ret.appendCondition(RdfGen.nTriple(var2Str, "<" + el.getURI() + ">", curVar));
			}

			return toRuleWrapper(ret);
		}
	}
}
