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
package wvw.mobibench.config.rules;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.config.ResourceConfig;
import wvw.mobibench.wrap.Carton;

public class RulesetConfig extends ResourceConfig {

	private RuleFormats ruleFormat;
	
	public RuleFormats getRuleFormat() {
		return ruleFormat;
	}

	public void setRuleFormat(RuleFormats ruleFormat) {
		this.ruleFormat = ruleFormat;
	}

	public boolean hasRulesString() {
		return hasString();
	}

	public String getRulesString() {
		return getString();
	}

	public void setRulesString(String rulesStr) {
		setString(rulesStr);
	}

	public boolean hasRulesList() {
		return hasList();
	}

	public List<String> getRulesList() {
		return getList();
	}

	public void setRulesList(List<String> rulesStr) {
		setList(rulesStr);
	}

	public RulesetConfig(JSONObject obj) throws JSONException {
		fromJson(obj);
	}

	public void toJson(JSONObject obj) throws JSONException {
	}

	public void fromJson(JSONObject obj) throws JSONException {
		super.fromJson(obj);
		
		setRuleFormat(RuleFormats.getEnum(obj.getString("format")));
	}

	public RulesetConfig(Carton in) {
		super(in);
		
		setRuleFormat(RuleFormats.getEnum(in.readInt()));
	}

	public void writeTo(Carton dest) {
		super.writeTo(dest);
		
		dest.writeInt(ruleFormat.getId());
	}
	
	public boolean equals(Object obj) {
		if (obj instanceof RulesetConfig)
			return super.equals(obj);
		
		return false;
	}
}
