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
package wvw.mobibench.service.select.domain.rule.str;

import java.util.ArrayList;
import java.util.List;

import wvw.mobibench.service.select.domain.rule.IRule;
import wvw.mobibench.service.select.domain.rule.IRuleset;

public class RulesetList implements IRuleset {

	private List<IRule> rules = new ArrayList<IRule>();

	public RulesetList() {
	}

	public RulesetList(List<IRule> rules) {
		this.rules = rules;
	}

	public void add(IRule rule) {
		rules.add(rule);
	}
	
	public void addAll(List<IRule> rules) {
		rules.addAll(rules);
	}
	
	public List<IRule> getRules() {
		return rules;
	}
}
