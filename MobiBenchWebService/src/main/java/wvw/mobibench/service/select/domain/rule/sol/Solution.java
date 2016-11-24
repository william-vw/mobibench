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
package wvw.mobibench.service.select.domain.rule.sol;

import java.util.HashMap;
import java.util.Map;

import wvw.mobibench.service.select.domain.rule.sol.SolutionSet.VarSet;
import wvw.utils.CloneUtils;

public class Solution {

	private SolutionSet set;
	private Map<VarSet, String> map = new HashMap<VarSet, String>();

	public void setSolutionSet(SolutionSet set) {
		this.set = set;
	}

	public String get(String var) {
		return get(var, true);
	}
	
	public String get(String var, boolean lazyAdd) {
		VarSet varSet = set.get(var, lazyAdd);
		
		if (varSet != null)
			return map.get(varSet);
		
		return null;
	}

	public void add(String var, String val) {
		VarSet varSet = set.get(var);
		
		map.put(varSet, val);
	}

	public boolean isEmpty() {
		return map.isEmpty();
	}
	
	public Solution clone() {
		Solution clone = new Solution();
		CloneUtils.clone(map, clone.map);

		return clone;
	}

}
