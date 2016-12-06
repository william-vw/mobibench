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

package wvw.mobibench.service.preproc.ont.inst_rules.handler;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.topbraid.spin.model.Element;
import org.topbraid.spin.model.Filter;
import org.topbraid.spin.model.FunctionCall;
import org.topbraid.spin.model.TriplePattern;
import org.topbraid.spin.model.TripleTemplate;
import org.topbraid.spin.model.Variable;

import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;

import wvw.mobibench.service.preproc.ont.RDFRes;
import wvw.utils.log2.Log;
import wvw.utils.rdf.RdfGen;
import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.build.RuleBuilder;

public class DefaultHandler extends Handler {

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
						(tp.getPredicate().equals(RDFRes.type) || 
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

	protected RuleBuilder doInstantiate(QuerySolution sol, int idx) {
		mapVars(sol);

		for (int i = start; i < body.size(); i++) {
			Element el = body.get(i);

			instantiateBody(el);
		}

		for (int i = 0; i < head.size(); i++)
			instantiateHead((TripleTemplate) head.get(i));

		return ret;
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

			if (fn.equals(RDFRes.ne)) {
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
