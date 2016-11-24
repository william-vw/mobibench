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

import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;

public abstract class EngineResourceConfig implements Cartonable, JsonReadable,
		JsonWritable {

	private boolean toArray = false;

	public EngineResourceConfig() {
	}

	public EngineResourceConfig(boolean toArray) {
		this.toArray = toArray;
	}

	public boolean isToArray() {
		return toArray;
	}

	public void setToArray(boolean toArray) {
		this.toArray = toArray;
	}

	public void toJson(JSONObject obj) throws JSONException {
		obj.put("toArray", toArray);
	}

	public void fromJson(JSONObject obj) throws JSONException {
	}

	public EngineResourceConfig(Carton in) {
		setToArray(in.readInt() == 1);
	}

	public void writeTo(Carton dest) {
		dest.writeInt(toArray ? 1 : 0);
	}
}
