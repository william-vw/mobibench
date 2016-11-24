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

import wvw.mobibench.service.select.domain.rule.IRule;
import wvw.mobibench.service.select.domain.rule.str.RuleString;

public class ReplacementRule extends RuleString {

	private List<ReplacedRule> replaced = new ArrayList<ReplacedRule>();
	private String axioms;

	public ReplacementRule(String id, List<String> replaced, String constructQuery, String axioms) {
		super(id, constructQuery);

		setReplaced(replaced);
		setAxioms(axioms);
	}

	public List<ReplacedRule> getReplaced() {
		return replaced;
	}

	public void setReplaced(List<String> replaced) {
		if (replaced != null) {

			for (String repl : replaced)
				this.replaced.add(new ReplacedRule(repl));
		}
	}

	public boolean hasAxioms() {
		return axioms != null;
	}

	public String getAxioms() {
		return axioms;
	}

	public void setAxioms(String axioms) {
		this.axioms = axioms;
	}

	public IRule getRule() {
		return new RuleString(getId(), getQuery());
	}

	public String toString() {
		return id + " <== " + replaced + "\n" + constructQuery
				+ (axioms != null ? axioms : "");
	}

	public class ReplacedRule {

		private String id;

		public ReplacedRule(String id) {
			this.id = id;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String toString() {
			return id;
		}

		public boolean equals(Object obj) {
			if (obj instanceof String)
				return id.equals(obj);

			if (obj instanceof ReplacedRule)
				return id.equals(((ReplacedRule) obj).getId());

			if (obj instanceof IRule)
				return id.equals(((IRule) obj).getId());

			return false;
		}
	}
}
