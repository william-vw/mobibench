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

import static wvw.mobibench.service.select.domain.rule.struct.tp.TermTypes.VAR;

public abstract class Term {

	private TermTypes type;

	protected Term(TermTypes type) {
		this.type = type;
	}

	public TermTypes getType() {
		return type;
	}

	public boolean matches(Term otherTerm) {
		if (type == VAR || otherTerm.type == VAR)
			return true;

		return ((Val) otherTerm).equals((Val) this, false);
	}
}
