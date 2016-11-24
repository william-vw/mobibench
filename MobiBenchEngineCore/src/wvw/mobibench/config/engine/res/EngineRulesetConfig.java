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
package wvw.mobibench.config.engine.res;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.config.rules.RuleFormats;
import wvw.mobibench.wrap.Carton;

public class EngineRulesetConfig extends EngineResourceConfig {

	private RuleFormats format;

	public EngineRulesetConfig(RuleFormats format) {
		this.format = format;
	}

	public EngineRulesetConfig(RuleFormats format, boolean toArray) {
		super(toArray);

		this.format = format;
	}

	public RuleFormats getFormat() {
		return format;
	}

	public void setFormat(RuleFormats format) {
		this.format = format;
	}

	public void toJson(JSONObject obj) throws JSONException {
		super.toJson(obj);

		obj.put("format", format.toString());
	}

	public void fromJson(JSONObject obj) throws JSONException {
	}

	public EngineRulesetConfig(Carton in) {
		super(in);

		setFormat(RuleFormats.getEnum(in.readInt()));
	}

	public void writeTo(Carton dest) {
		super.writeTo(dest);

		dest.writeInt(format.getId());
	}
}
