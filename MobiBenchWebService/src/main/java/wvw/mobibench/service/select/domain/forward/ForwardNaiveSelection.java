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
package wvw.mobibench.service.select.domain.forward;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import wvw.mobibench.service.select.RulesetSelectionException;
import wvw.mobibench.service.select.domain.DomainBasedSelectConfig;
import wvw.mobibench.service.select.domain.DomainBasedSelection;
import wvw.mobibench.service.select.domain.Ontology;
import wvw.mobibench.service.select.domain.rule.IRule;
import wvw.mobibench.service.select.domain.rule.IRuleParser;
import wvw.mobibench.service.select.domain.rule.IRuleset;
import wvw.mobibench.service.select.domain.rule.RuleParseException;
import wvw.mobibench.service.select.domain.rule.str.RuleString;

import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.rdf.model.Model;

public class ForwardNaiveSelection extends DomainBasedSelection {

	public List<IRule> selectRuleset(IRuleset ruleset, Ontology ontology,
			DomainBasedSelectConfig config) throws RulesetSelectionException {

		int nrRules0 = ruleset.getRules().size();
		System.out.println("original # rules: " + nrRules0 + "\n");

		createModel(ontology);

		List<IRule> ret = new ArrayList<IRule>();
		while (true) {
			long size = model.size();
			System.out.println("model.size: " + size);

			Iterator<IRule> ruleIt = ruleset.getRules().iterator();
			while (ruleIt.hasNext()) {
				RuleString rule = (RuleString) ruleIt.next();
				// System.out.println("rule: " + rule);

				QueryExecution exec = QueryExecutionFactory
						.create(rule.getQuery(), model);
				Model res = exec.execConstruct();

				if (res.size() > 0) {
					// System.out.println("results found");

					ret.add(rule);
					ruleIt.remove();

					model.add(res);
				}
			}

			System.out.println(model.size() + " - " + size);
			if (model.size() == size) {
				int nrRules1 = ret.size();
				int diff = nrRules1 - nrRules0;

				System.out.println("\ndone (# rules: (new) " + nrRules1
						+ " <> (old) " + nrRules0 + ": " + diff + ")");

				return ret;
			}
		}
	}

	protected IRuleset parse(String rules) throws RuleParseException {
		IRuleParser parser = new ForwardNaiveRuleParser();

		return parser.parse(rules);
	}
}
