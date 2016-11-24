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

package wvw.mobibench.service.select.domain.rule.struct;

import wvw.mobibench.service.select.domain.rule.IRule;

public class StructuredRule extends IRule {

	private RuleClause head;
	private RuleClause body;

	private RuleSolutionSet solution;

	public StructuredRule(String id, RuleClause head, RuleClause body) {
		super(id);

		this.head = head;
		this.body = body;
	}

	public RuleClause getHead() {
		return head;
	}

	public RuleClause getBody() {
		return body;
	}

	public boolean hasSolution() {
		return solution != null;
	}
	
	public RuleSolutionSet getSolution() {
		return solution;
	}

	public void setSolution(RuleSolutionSet solution) {
		this.solution = solution;
	}

}
