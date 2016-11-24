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

package wvw.mobibench.service.select.domain.rule.struct.tp;

public class Var extends Term {

	private String name;

	public Var() {
		super(TermTypes.VAR);
	}

	public Var(String name) {
		super(TermTypes.VAR);
		
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public boolean equals(Object obj) {
		if (obj instanceof Var)
			return name.equals(((Var) obj).name);
		
		return false;
	}
	
	public int hashCode() {
		return toString().hashCode();
	}
	
	public String toString() {
		return "?" + name;
	}
}
