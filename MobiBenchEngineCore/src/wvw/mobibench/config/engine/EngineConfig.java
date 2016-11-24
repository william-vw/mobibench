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
package wvw.mobibench.config.engine;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.config.engine.res.EngineDatasetConfig;
import wvw.mobibench.config.engine.res.EngineRulesetConfig;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;
import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;

public class EngineConfig implements Cartonable, JsonReadable, JsonWritable {

	private EngineRulesetConfig ruleConfig;
	private EngineDatasetConfig dataConfig;

	private EngineReasoningConfig reasonConfig;

	public EngineConfig() {
	}

	public EngineConfig(EngineDatasetConfig dataConfig) {
		this.dataConfig = dataConfig;
	}

	public EngineConfig(EngineDatasetConfig dataConfig, EngineReasoningConfig reasonConfig) {
		this.dataConfig = dataConfig;
		this.reasonConfig = reasonConfig;
	}

	public EngineConfig(EngineRulesetConfig ruleConfig,
			EngineDatasetConfig dataConfig, EngineReasoningConfig reasonConfig) {

		this.ruleConfig = ruleConfig;
		this.dataConfig = dataConfig;
		this.reasonConfig = reasonConfig;
	}

	public boolean hasRuleConfig() {
		return ruleConfig != null;
	}

	public EngineRulesetConfig getRuleConfig() {
		return ruleConfig;
	}

	public void setRuleConfig(EngineRulesetConfig ruleConfig) {
		this.ruleConfig = ruleConfig;
	}

	public boolean hasDataConfig() {
		return dataConfig != null;
	}

	public EngineDatasetConfig getDataConfig() {
		return dataConfig;
	}

	public void setDataConfig(EngineDatasetConfig dataConfig) {
		this.dataConfig = dataConfig;
	}

	public boolean hasReasonConfig() {
		return reasonConfig != null;
	}

	public EngineReasoningConfig getReasonConfig() {
		return reasonConfig;
	}

	public void setReasonConfig(EngineReasoningConfig reasonConfig) {
		this.reasonConfig = reasonConfig;
	}

	public void toJson(JSONObject obj) throws JSONException {
		JSONObject resObj = new JSONObject();

		if (hasRuleConfig()) {
			JSONObject ruleObj = new JSONObject();
			ruleConfig.toJson(ruleObj);

			resObj.put("rules", ruleObj);
		}

		if (hasDataConfig()) {
			JSONObject dataObj = new JSONObject();
			dataConfig.toJson(dataObj);

			resObj.put("data", dataObj);
		}

		if (resObj.length() > 0)
			obj.put("resources", resObj);

		if (hasReasonConfig()) {

			JSONObject reasObj = new JSONObject();
			reasonConfig.toJson(reasObj);

			obj.put("reasoning", reasObj);
		}
	}

	public void fromJson(JSONObject obj) throws JSONException {
	}

	public EngineConfig(Carton in) {
		if (in.readInt() == 1)
			setRuleConfig(new EngineRulesetConfig(in));
		if (in.readInt() == 1)
			setDataConfig(new EngineDatasetConfig(in));

		if (in.readInt() == 1)
			setReasonConfig(new EngineReasoningConfig(in));
	}

	public void writeTo(Carton dest) {
		dest.writeInt(hasRuleConfig() ? 1 : 0);
		if (hasRuleConfig())
			ruleConfig.writeTo(dest);

		dest.writeInt(hasDataConfig() ? 1 : 0);
		if (hasDataConfig())
			dataConfig.writeTo(dest);

		dest.writeInt(hasReasonConfig() ? 1 : 0);
		if (hasReasonConfig())
			reasonConfig.writeTo(dest);
	}

}
