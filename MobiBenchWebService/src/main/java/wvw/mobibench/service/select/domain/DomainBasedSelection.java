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
package wvw.mobibench.service.select.domain;

import java.io.StringReader;
import java.util.List;

import wvw.mobibench.service.select.RulesetSelectionException;
import wvw.mobibench.service.select.SelectConfig;
import wvw.mobibench.service.select.SelectOutput;
import wvw.mobibench.service.select.domain.rule.IRule;
import wvw.mobibench.service.select.domain.rule.IRuleset;
import wvw.mobibench.service.select.domain.rule.RuleParseException;
import wvw.mobibench.service.select.domain.rule.RulePrinter;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;

public abstract class DomainBasedSelection {

	protected Model model;

	public SelectOutput select(SelectConfig config)
			throws RulesetSelectionException {
		DomainBasedSelectConfig dbConfig = (DomainBasedSelectConfig) config;

		StringBuffer data = new StringBuffer();
		data.append(dbConfig.getAxioms()).append("\n");
		data.append(dbConfig.getOntology());

		try {
			Ontology ontology = new Ontology(data.toString(),
					dbConfig.getSyntax());
			IRuleset ruleset = parse(dbConfig.getRules());

			List<IRule> ret = selectRuleset(ruleset, ontology, dbConfig);
			outputRemoved(ruleset, ret);

			return new SelectOutput(print(ret));

		} catch (RuleParseException e) {
			throw new RulesetSelectionException(e);
		}
	}

	private void outputRemoved(IRuleset orRules, List<IRule> resRules) {
		for (IRule rule : orRules.getRules())

			if (!resRules.contains(rule))
				System.out.println("removed: " + rule.getId());
	}

	public abstract List<IRule> selectRuleset(IRuleset rules, Ontology ontology,
			DomainBasedSelectConfig config) throws RulesetSelectionException;

	protected abstract IRuleset parse(String rules) throws RuleParseException;

	protected String print(List<IRule> rules) {
		RulePrinter printer = new RulePrinter();

		return printer.print(rules);
	}

	protected void createModel(Ontology ontology) {
		model = ModelFactory.createDefaultModel();

		model.read(new StringReader(ontology.getRdf()), "",
				ontology.getSyntax());
	}
}
