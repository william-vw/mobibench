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

package wvw.mobibench.service.select.def;

import java.util.List;

import wvw.mobibench.service.select.SelectConfig;
import wvw.mobibench.service.select.SelectOutput;
import wvw.mobibench.service.select.RulesetSelection;
import wvw.mobibench.service.select.def.ReplacementRule.ReplacedRule;
import wvw.mobibench.service.select.domain.rule.IRule;
import wvw.mobibench.service.select.domain.rule.RulePrinter;

public class DefaultSelection implements RulesetSelection {

	public SelectOutput select(SelectConfig config) {
		DefaultSelectConfig dConfig = (DefaultSelectConfig) config;

		List<IRule> curRules = dConfig.getRules();
		StringBuffer curAxioms = new StringBuffer(dConfig.getAxioms());

		for (Selection selection : dConfig.getSelections()) {

			if (selection.hasRelevantAxioms())
				curAxioms = new StringBuffer(selection.getRelevantAxioms());

			else if (selection.hasAddedAxioms()) {
				System.out.println("added: " + selection.getAddedAxioms());

				curAxioms.append("\n").append(selection.getAddedAxioms());
			}

			if (selection.hasAddedRules()) {
				for (AddedRule rule : selection.getAddedRules()) {

					if (!curRules.contains(rule)) {
						curRules.add(rule);

						System.out.println("\nadded rule: " + rule.getId());
					}
				}
			}

			if (selection.hasRemovedRules()) {
				List<RemovedRule> removed = selection.getRemovedRules();

				for (RemovedRule rule : removed) {

					if (curRules.remove(rule))
						System.out.println("removed: " + rule.getId());
				}
			}

			if (selection.hasReplacementRules()) {
				List<ReplacementRule> replacements = selection
						.getReplacementRules();

				for (ReplacementRule replacement : replacements) {
					System.out.println("\nrepl-rule: " + replacement.getId());

					List<ReplacedRule> toReplaces = replacement.getReplaced();

					boolean doReplace = true;
					for (ReplacedRule toReplace : toReplaces) {

						if (!curRules.contains(toReplace)) {
							doReplace = false;

							break;
						}
					}

					if (doReplace) {
						System.out.println("replacing..");

						for (ReplacedRule toReplace : toReplaces) {
							System.out.println("removed: " + toReplace);

							curRules.remove(toReplace);
						}

						System.out.println(
								"adding: " + replacement.getRule().getId());
						curRules.add(replacement.getRule());

						if (replacement.hasAxioms()) {
							System.out.println(
									"adding: " + replacement.getAxioms());

							curAxioms.append(replacement.getAxioms());
						}

					} else
						System.out
								.println("skipping: to-replace not all found");
				}
			}
		}

		SelectOutput output = new SelectOutput(curAxioms.toString(),
				new RulePrinter().print(curRules));

		// System.out.println("\noutput: " + output);

		return output;
	}
}