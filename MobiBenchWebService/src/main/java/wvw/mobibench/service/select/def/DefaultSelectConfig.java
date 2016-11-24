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

import java.util.ArrayList;
import java.util.List;

import wvw.mobibench.service.convert.ConvertConfig;
import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.rulestr.SPIN2RuleStr;
import wvw.mobibench.service.select.SelectConfig;
import wvw.mobibench.service.select.def.Selection.InitSelection;
import wvw.mobibench.service.select.domain.rule.IRule;

public class DefaultSelectConfig implements SelectConfig {

	private List<IRule> rules;
	private String axioms;

	private List<Selection> selections = new ArrayList<Selection>();

	public DefaultSelectConfig() {
	}

	public DefaultSelectConfig(InitSelectConfig initConfig) {
		setRules(initConfig.getRules());
		setAxioms(initConfig.getAxioms());

		setSelections(initConfig.getSelections());
	}

	public List<IRule> getRules() {
		return rules;
	}

	public void setRules(String rules) {
		this.rules = parseRules(rules);
	}

	public String getAxioms() {
		return axioms;
	}

	public void setAxioms(String axioms) {
		this.axioms = axioms;
	}

	public void add(Selection selection) {
		selections.add(selection);
	}

	public void setSelections(List<InitSelection> selections) {
		for (InitSelection initSelect : selections)
			this.selections.add(new Selection(initSelect));
	}

	public List<Selection> getSelections() {
		return selections;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<IRule> parseRules(String rules) {
		try {
			SPIN2RuleStr conv = new SPIN2RuleStr();
			List<IRule> result = (List) conv.convertRules(rules, new ConvertConfig(false));

			return result;

		} catch (ConvertException e) {
			e.printStackTrace();

			return null;
		}
	}

	public String toString() {
		return /* "rules:\n" + rules + "\naxioms:\n" + axioms + */"\nselections:\n" + selections + "\n";
	}

	public class InitSelectConfig {

		private String rules;
		private String axioms;

		private List<InitSelection> selections = new ArrayList<InitSelection>();

		public String getRules() {
			return rules;
		}

		public void setRules(String rules) {
			this.rules = rules;
		}

		public String getAxioms() {
			return axioms;
		}

		public void setAxioms(String axioms) {
			this.axioms = axioms;
		}

		public List<InitSelection> getSelections() {
			return selections;
		}

		public void setSelections(List<InitSelection> selections) {
			this.selections = selections;
		}
	}
}
