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

public abstract class Val extends Term {

	private ValueTypes valueType;

	public Val(ValueTypes type) {
		super(TermTypes.VAL);

		this.valueType = type;
	}

	public ValueTypes getValueType() {
		return valueType;
	}

	public abstract String getStr();

	public boolean equals(Object obj) {
		return equals(obj, true);
	}

	public boolean equals(Object obj, boolean strict) {
		return equals(null, obj, strict);
	}

	public abstract boolean equals(Res prop, Object obj, boolean strict);

	public int hashCode() {
		return getStr().hashCode();
	}
}
