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

public class Lit extends Val {

	private String str;

	public Lit(String str) {
		super(ValueTypes.LITERAL);

		this.str = str;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public boolean equals(Res prop, Object obj, boolean strict) {
		if (obj instanceof Lit) {
			Lit lit = (Lit) obj;

			return str.equals(lit.str);

		} else
			return false;
	}

	public String toString() {
		return str;
	}
}
