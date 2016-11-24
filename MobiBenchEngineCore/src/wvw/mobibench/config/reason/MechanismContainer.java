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
package wvw.mobibench.config.reason;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;

public class MechanismContainer implements Cartonable, JsonReadable, JsonWritable {

	protected Map<TaskTypes, ReasoningMechanism> mechanisms = new HashMap<TaskTypes, ReasoningMechanism>();

	public MechanismContainer() {}
	
	public void addMechanism(TaskTypes type, ReasoningMechanism mechanism) {
		mechanisms.put(type, mechanism);
	}

	public Iterator<TaskTypes> getMechanismReasonTypes() {
		return mechanisms.keySet().iterator();
	}

	public ReasoningMechanism getMechanism(TaskTypes type) {
		return mechanisms.get(type);
	}

	public MechanismContainer(JSONObject obj) throws JSONException {
		fromJson(obj);
	}

	public void toJson(JSONObject obj) throws JSONException {
		if (mechanisms.size() > 0) {
			JSONObject mObjs = new JSONObject();
			obj.put("mechanism", mObjs);

			Iterator<TaskTypes> it = getMechanismReasonTypes();
			while (it.hasNext()) {
				TaskTypes type = it.next();

				JSONObject mObj = new JSONObject();

				ReasoningMechanism mechanism = mechanisms.get(type);
				mechanism.toJson(mObj);

				mObjs.put(type.getLabel(), mObj);
			}
		}
	}

	public void fromJson(JSONObject obj) throws JSONException {
		if (obj.has("mechanism")) {
			JSONObject mObjs = obj.getJSONObject("mechanism");

			JSONArray mTypes = mObjs.names();
			for (int i = 0; i < mTypes.length(); i++) {
				String mType = mTypes.getString(i);
				TaskTypes type = TaskTypes.getEnum(mType);

				JSONObject mObj = mObjs.getJSONObject(mType);

				mechanisms.put(type, new ReasoningMechanism(mObj));
			}
		}
	}

	public MechanismContainer(Carton in) {
		int nrMechs = in.readInt();
		while (nrMechs-- > 0) {
			TaskTypes type = TaskTypes.getEnum(in.readInt());
			ReasoningMechanism mechanism = new ReasoningMechanism(in);

			mechanisms.put(type, mechanism);
		}
	}

	public void writeTo(Carton dest) {
		dest.writeInt(mechanisms.size());

		Iterator<TaskTypes> it = getMechanismReasonTypes();
		while (it.hasNext()) {
			TaskTypes type = it.next();
			dest.writeInt(type.getId());

			ReasoningMechanism mechanism = mechanisms.get(type);
			mechanism.writeTo(dest);
		}
	}
}
