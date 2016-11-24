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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class SolutionSet {

	private List<Solution> sols = new ArrayList<Solution>();
	private Map<String, VarSet> map = new HashMap<String, VarSet>();

	public SolutionSet() {
	}

	public SolutionSet(Solution sol) {
		add(sol);
	}

	public void add(Solution sol) {
		sols.add(sol);

		sol.setSolutionSet(this);
	}
	
	public void add(SolutionSet set) {
		Iterator<Solution> solIt = set.solutions();
		
		while (solIt.hasNext()) 
			sols.add(solIt.next());
	}
	
	public boolean has(String var) {
		return get(var, false) != null;
	}

	public VarSet get(String var) {
		return get(var, true);
	}

	public VarSet get(String var, boolean lazyAdd) {
		VarSet varSet = map.get(var);
		if (varSet == null && lazyAdd) {
			varSet = new VarSet(var);

			map.put(var, varSet);
		}

		return varSet;
	}

	public void map(String var1, String var2) {
		VarSet varSet = get(var1);
		// varSet.add(var2);

		map.put(var2, varSet);
	}

	public boolean isEmpty() {
		return (sols.isEmpty() || sols.get(0).isEmpty());
	}

	public Iterator<Solution> solutions() {
		return sols.iterator();
	}

	public Iterator<String> variables() {

		return new Iterator<String>() {
			private Iterator<VarSet> varIt = map.values().iterator();

			public boolean hasNext() {
				return varIt.hasNext();
			}

			public String next() {
				return varIt.next().get(0);
			}
			
			public void remove() {
				
			}
		};
	}

	public SolutionSet clone() {
		SolutionSet set = new SolutionSet();
		for (Solution sol : sols)
			set.sols.add(sol.clone());

		return set;
	}

	public class VarSet {

		private List<String> vars = new ArrayList<String>();

		public VarSet(String var) {
			vars.add(var);
		}

		public void add(String var) {
			vars.add(var);
		}

		public String get(int idx) {
			return vars.get(idx);
		}

		public int size() {
			return vars.size();
		}
	}
}