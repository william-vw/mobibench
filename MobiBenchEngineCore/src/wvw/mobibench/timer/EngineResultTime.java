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
package wvw.mobibench.timer;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;
import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;
import wvw.utils.timer.ResultTime;

public class EngineResultTime extends ResultTime
		implements Cartonable, JsonReadable, JsonWritable {

	public EngineResultTime(String id, long time) {
		super(id, time);
	}

	public void toJson(JSONObject obj) throws JSONException {
		obj.put("id", id);
		obj.put("time", time);
	}

	public void fromJson(JSONObject obj) throws JSONException {
		setId(obj.getString("id"));
		setTime(obj.getLong("time"));
	}

	public EngineResultTime(Carton in) {
		super(in.readString(), in.readLong());
	}

	public void writeTo(Carton dest) {
		dest.writeString(id);
		dest.writeLong(time);
	}
}