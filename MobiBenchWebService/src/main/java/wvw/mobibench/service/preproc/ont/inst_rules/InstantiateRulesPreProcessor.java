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
import org.topbraid.spin.model.TripleTemplate;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.Property;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.rdf.model.Statement;

import wvw.mobibench.service.preproc.PreProcessConfig;
import wvw.mobibench.service.preproc.PreProcessConfig.Ontology;
import wvw.mobibench.service.preproc.PreProcessException;
import wvw.mobibench.service.preproc.PreProcessResults;
import wvw.mobibench.service.preproc.PreProcessTypes;
import wvw.mobibench.service.preproc.ont.OntologyBasedPreProcessor;
import wvw.mobibench.service.res.ServiceResources;
import wvw.utils.rdf.RdfGen;
import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.RulesUtils;
import wvw.utils.rule.builder.RuleBuilder;
import wvw.utils.rule.builder.SpinRuleBuilder;

public class InstantiateRulesPreProcessor extends OntologyBasedPreProcessor {

	private Map<String, Property> idMap = new HashMap<String, Property>();

	public InstantiateRulesPreProcessor(ServiceResources res) {
		super(res);
	}

	public PreProcessResults doPreprocess(PreProcessConfig config)
			throws PreProcessException {

		Ontology ontology = config.getOntology();
		try {
			Model m = loadModel(ontology.getContent(), ontology.getSyntax());
			initMap();

			List<RuleWrapper> rules = RulesUtils.splitRules(
					res.getContents(rootPath + "inst_rules/rules.spin"));
			// Log.d("rules: " + rules);

			List<RuleWrapper> processed = new ArrayList<RuleWrapper>();

			Iterator<RuleWrapper> ruleIt = rules.iterator();
			while (ruleIt.hasNext()) {
				RuleWrapper rule = ruleIt.next();

				Property p = idMap.get(rule.getComment());

				// NOTE p should never be null
				if (p != null) {
					ruleIt.remove();

					List<RuleWrapper> ret = preprocessRule(rule, p, m);
					processed.addAll(ret);
				}
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

	private List<RuleWrapper> preprocessRule(RuleWrapper rule, Property p,
			Model m) {

		List<RuleWrapper> ret = new ArrayList<RuleWrapper>();
		List<Statement> stmts = copyStmts(
				m.listStatements(null, p, (RDFNode) null));

		for (int i = 0; i < stmts.size(); i++) {
			Statement stmt = stmts.get(i);
			// Log.d("stmt: " + stmt);

			RuleWrapper r = null;

			if (p == intersectionOf)
				r = handleIntersection(i, rule, stmt, m);

			else if (p == propertyChainAxiom)
				r = handlePropertyChain(i, rule, stmt, m);

			else if (p == hasKey)
				r = handleHasKey(i, rule, stmt, m);

			ret.add(r);
		}

		return ret;
	}

	private RuleWrapper handleIntersection(int idx, RuleWrapper rule,
			Statement stmt, Model m) {

		return new IntersectionHandler(idx, rule, stmt, m).handle();
	}

	private RuleWrapper handlePropertyChain(int idx, RuleWrapper rule,
			Statement stmt, Model m) {

		return new PropertyChainHandler(idx, rule, stmt, m).handle();
	}

	private RuleWrapper handleHasKey(int idx, RuleWrapper rule, Statement stmt,
			Model m) {

		return new HasKeyHandler(idx, rule, stmt, m).handle();
	}

	private Construct toConstruct(String constructQuery, Model m) {
		Query arqQuery = ARQFactory.get().createQuery(m, constructQuery);

		ARQ2SPIN arq2SPIN = new ARQ2SPIN(m);
		Construct spinQuery = (Construct) arq2SPIN.createQuery(arqQuery, null);

		return spinQuery;
	}

	private RuleBuilder toRuleBuilder(RuleWrapper rule, int idx) {
		return new SpinRuleBuilder(rule.getComment().substring(2) + "-" + idx);
	}

	private RuleWrapper toRuleWrapper(RuleBuilder r) {
		return new RuleWrapper("# " + r.getId(), r.toString());
	}

	private void initMap() {
		idMap.put("# cls-int1", intersectionOf);
		idMap.put("# prp-spo2", propertyChainAxiom);
		idMap.put("# prp-key", hasKey);
	}

	private abstract class Handler {

		protected RuleBuilder ret;
		protected TripleTemplate triple;

		protected Resource subj;
		protected List<Resource> chain;

		public Handler(int idx, RuleWrapper rule, Statement stmt, Model m) {
			this.ret = toRuleBuilder(rule, idx);

			Construct query = toConstruct(rule.getRule(), m);
			List<TripleTemplate> construct = query.getTemplates();

			this.triple = construct.get(0);

			this.subj = stmt.getSubject().asResource();

			Resource list0 = stmt.getObject().asResource();
			this.chain = collectChain(list0, m);
		}

		public abstract RuleWrapper handle();
	}

	private class IntersectionHandler extends Handler {

		public IntersectionHandler(int idx, RuleWrapper rule, Statement stmt,
				Model m) {

			super(idx, rule, stmt, m);
		}

		public RuleWrapper handle() {
			Resource var = triple.getSubject();

			ret.appendTemplate(RdfGen.nTriple(var, type, subj));

			for (int j = 0; j < chain.size(); j++) {
				Resource list = chain.get(j);

				Resource el = list.getPropertyResourceValue(first);
				ret.appendCondition(RdfGen.nTriple(var, type, el));
			}

			return toRuleWrapper(ret);
		}
	}

	private class PropertyChainHandler extends Handler {

		public PropertyChainHandler(int idx, RuleWrapper rule, Statement stmt,
				Model m) {

			super(idx, rule, stmt, m);
		}

		public RuleWrapper handle() {
			Resource var = triple.getSubject();

			String prevVar = var.toString(), curVar = null;
			for (int j = 0; j < chain.size(); j++) {

				Resource list = chain.get(j);
				curVar = "?u" + (j + 2);

				Resource el = list.getPropertyResourceValue(first);
				ret.appendCondition(RdfGen.nTriple(prevVar,
						"<" + el.getURI() + ">", curVar));

				prevVar = curVar;
			}

			ret.appendTemplate(RdfGen.nTriple(var.toString(),
					"<" + subj.getURI() + ">", curVar));

			return toRuleWrapper(ret);
		}
	}

	private class HasKeyHandler extends Handler {

		public HasKeyHandler(int idx, RuleWrapper rule, Statement stmt,
				Model m) {

			super(idx, rule, stmt, m);
		}

		public RuleWrapper handle() {
			Resource var1 = triple.getSubject();
			Resource var2 = (Resource) triple.getObject();

			String var1Str = var1.toString();
			String var2Str = var2.toString();

			ret.appendTemplate(RdfGen.nTriple(var1, sameAs, var2));

			ret.appendCondition(RdfGen.nTriple(var1, type, subj));
			ret.appendCondition(RdfGen.nTriple(var2, type, subj));

			for (int j = 0; j < chain.size(); j++) {
				Resource list = chain.get(j);
				String curVar = "?z" + j;

				Resource el = list.getPropertyResourceValue(first);

				ret.appendCondition(RdfGen.nTriple(var1Str,
						"<" + el.getURI() + ">", curVar));
				ret.appendCondition(RdfGen.nTriple(var2Str,
						"<" + el.getURI() + ">", curVar));
			}

			return toRuleWrapper(ret);
		}
	}
}
