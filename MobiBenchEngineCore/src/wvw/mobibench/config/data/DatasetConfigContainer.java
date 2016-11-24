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
package wvw.mobibench.config.data;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;
import wvw.utils.JsonReadable;

public class DatasetConfigContainer implements Cartonable, JsonReadable {

	private Map<DatasetTypes, DatasetConfig> configs = new HashMap<DatasetTypes, DatasetConfig>();

	public Iterator<DatasetTypes> getTypes() {
		return configs.keySet().iterator();
	}

	public DatasetConfig getConfig(DatasetTypes type) {
		return configs.get(type);
	}

	public DatasetConfig getConfig() {
		return configs.values().iterator().next();
	}

	public DatasetConfigContainer(JSONObject obj) throws JSONException {
		fromJson(obj);
	}

	public void fromJson(JSONObject obj) throws JSONException {		
		if (obj.has("format"))
			configs.put(null, new DatasetConfig(obj));

		else {
			for (DatasetTypes type : DatasetTypes.values())

				if (obj.has(type.getLabel()))
					configs.put(type, new DatasetConfig(obj.getJSONObject(type.getLabel())));
		}
	}

	public DatasetConfigContainer(Carton in) {
		int nrConfigs = in.readInt();
		while (nrConfigs-- > 0) {
			DatasetTypes type = null;

			int typeId = in.readInt();
			if (typeId != -1)
				type = DatasetTypes.getEnum(typeId);

			configs.put(type, new DatasetConfig(in));
		}
	}

	public void writeTo(Carton dest) {
		dest.writeInt(configs.entrySet().size());

		Iterator<Map.Entry<DatasetTypes, DatasetConfig>> it = configs.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<DatasetTypes, DatasetConfig> entry = it.next();

			dest.writeInt(entry.getKey() == null ? -1 : entry.getKey().getId());
			entry.getValue().writeTo(dest);
		}
	}
}
