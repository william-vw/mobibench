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

import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Model;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.jena.SPIN2Jena;
import wvw.mobibench.service.preproc.PreProcessConfig;
import wvw.mobibench.service.preproc.PreProcessException;
import wvw.mobibench.service.preproc.PreProcessResults;
import wvw.mobibench.service.preproc.ont.OntologyBasedPreProcessor;
import wvw.mobibench.service.preproc.ont.inst_rules.handler.Handler;
import wvw.mobibench.service.res.ServiceResources;
import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.RulesUtils;
import wvw.utils.rule.build.RuleBuilder;

public abstract class InstantiatePreProcessor extends OntologyBasedPreProcessor {

	protected Map<String, Handler> idMap = new HashMap<String, Handler>();

	public InstantiatePreProcessor(ServiceResources res) {
		super(res);
	}

	public PreProcessResults doPreprocess(PreProcessConfig config) throws PreProcessException {
		try {
			Model m = getModel(config);
			initMap();

			List<RuleWrapper> rules = getRules(config);

			List<RuleBuilder> processed = new ArrayList<RuleBuilder>();

			Iterator<RuleWrapper> ruleIt = rules.iterator();
			while (ruleIt.hasNext()) {
				RuleWrapper rule = ruleIt.next();

				if (checkRule(rule, ruleIt)) {
					ruleIt.remove();

					Handler handler = idMap.get(rule.getComment());
					if (handler == null)
						handler = idMap.get(null);

					if (handler == null)
						throw new PreProcessException("ERROR: unsupported rule: " + rule.getComment());

					List<RuleBuilder> ret = preprocess(rule, handler, m);
					processed.addAll(ret);
				}
			}

			List<RuleWrapper> newRules = postprocess(processed);

			// Log.d("retained: " + rules);
			// Log.d("added: " + processed);

			rules.addAll(newRules);
			// Log.d("final: " + rules);

			String rulesStr = RulesUtils.mergeRules(rules);

			return new PreProcessResults(rulesStr);

		} catch (IOException e) {
			throw new PreProcessException(e);
		}
	}

	protected abstract Model getModel(PreProcessConfig config) throws IOException;

	protected abstract List<RuleWrapper> getRules(PreProcessConfig config) throws IOException;

	protected abstract boolean checkRule(RuleWrapper rule, Iterator<RuleWrapper> ruleIt);

	private List<RuleBuilder> preprocess(RuleWrapper rule, Handler handler, Model m) {
		// Log.d("rule: " + rule);
		List<RuleBuilder> ret = new ArrayList<RuleBuilder>();

		int idx = 0;
		String query = handler.getQuery(rule, m);
		// Log.d("query: " + query);

		ResultSet res = QueryExecutionFactory.create(query, m).execSelect();
		while (res.hasNext()) {
			QuerySolution sol = res.next();

			RuleBuilder r = handler.instantiate(sol, idx++);
			// Log.d("r: " + r);

			ret.add(r);
		}
		// Log.d("");

		return ret;
	}

	private List<RuleWrapper> postprocess(List<RuleBuilder> rules) {
		for (int i = 0; i < rules.size(); i++) {
			RuleBuilder rule = rules.get(i);

			for (int j = i + 1; j < rules.size(); j++) {
				RuleBuilder rule2 = rules.get(j);

				// Log.d("postprocess: " + rule + " <> " + rule2);
				if (rule.getCondition().equals(rule2.getCondition())) {
					if (!rule.getTemplates().contains(rule2.getTemplates())
							&& !rule.getCondition().contains(rule2.getTemplates())) {
						
						rule.appendTemplate(rule2.getTemplates());

					} // else Log.d("duplicate rule: " + rule2);

					rules.remove(j--);
				}
			}
		}

		List<RuleWrapper> ret = new ArrayList<RuleWrapper>();
		for (RuleBuilder rule : rules)
			ret.add(toRuleWrapper(rule));

		return ret;
	}

	protected abstract void initMap();

	protected void loadIds(String name, List<String> list) throws IOException {
		List<RuleWrapper> rules = loadRules(name);

		for (RuleWrapper rule : rules)
			list.add(rule.getComment());
	}

	protected String loadRulesAsString(String name) throws IOException {
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

	protected List<RuleWrapper> loadRules(String name) throws IOException {
		return RulesUtils.splitRules(res.getContents(rootPath + "inst_rules/" + name));
	}

	protected RuleWrapper toRuleWrapper(RuleBuilder r) {
		return new RuleWrapper("# " + r.getId(), r.toString());
	}

}
