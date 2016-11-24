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

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.utils.JsonReadable;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;

public class RulesetConfigContainer implements Cartonable, JsonReadable {

	private Map<RulesetTypes, RulesetConfig> configs = new HashMap<RulesetTypes, RulesetConfig>();

	public Iterator<RulesetTypes> getTypes() {
		return configs.keySet().iterator();
	}

	public RulesetConfig getConfig(RulesetTypes type) {
		return configs.get(type);
	}

	public RulesetConfig getConfig() {
		return configs.values().iterator().next();
	}

	public RulesetConfigContainer(JSONObject obj) throws JSONException {
		fromJson(obj);
	}

	public void fromJson(JSONObject obj) throws JSONException {
		if (obj.has("format"))
			configs.put(null, new RulesetConfig(obj));

		else {
			for (RulesetTypes type : RulesetTypes.values())

				if (obj.has(type.getLabel()))
					configs.put(type, new RulesetConfig(obj.getJSONObject(type.getLabel())));
		}
	}

	public RulesetConfigContainer(Carton in) {
		int nrConfigs = in.readInt();
		while (nrConfigs-- > 0) {
			RulesetTypes type = null;

			int typeId = in.readInt();
			if (typeId != -1)
				type = RulesetTypes.getEnum(typeId);

			configs.put(type, new RulesetConfig(in));
		}
	}

	public void writeTo(Carton dest) {
		dest.writeInt(configs.entrySet().size());

		Iterator<Map.Entry<RulesetTypes, RulesetConfig>> it = configs.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<RulesetTypes, RulesetConfig> entry = it.next();

			dest.writeInt(entry.getKey() == null ? -1 : entry.getKey().getId());
			entry.getValue().writeTo(dest);
		}
	}
}
