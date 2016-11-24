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

import wvw.mobibench.service.select.domain.rule.IRule;

public class RuleString extends IRule {

	protected String constructQuery;

	public RuleString(String id) {
		super(id);
	}

	public RuleString(String id, String constructQuery) {
		super(id);

		this.constructQuery = constructQuery;
	}

	public String getQuery() {
		return constructQuery;
	}

	public void setQuery(String constructQuery) {
		this.constructQuery = constructQuery;
	}

	public String toString() {
		return id + "\n" + constructQuery;
	}
}
