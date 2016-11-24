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

import wvw.mobibench.service.select.domain.rule.IRule;

public class RemovedRule {

	private String id;

	public RemovedRule(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean equals(Object obj) {
		if (obj instanceof String)
			return id.equals(obj);
		
		if (obj instanceof IRule)
			return id.equals(((IRule) obj).getId());
		
		if (obj instanceof RemovedRule)
			return id.equals(((RemovedRule) obj).getId());
		
		return false;
	}
	
	public String toString() {
		return id;
	}
}
