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

import java.util.Map.Entry;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;
import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;
import wvw.utils.timer.ResultTime;
import wvw.utils.timer.ResultTimes;

public class EngineResultTimes extends ResultTimes
		implements Cartonable, JsonReadable, JsonWritable {

	public EngineResultTimes(ResultTime... times) {
		super(times);
	}

	public void toJson(JSONObject obj) throws JSONException {
		for (Entry<String, ResultTime> time : times.entrySet()) {
			JSONObject timeObj = new JSONObject();
			((EngineResultTime) time.getValue()).toJson(timeObj);

			obj.put(time.getKey(), timeObj);
		}
	}

	public void fromJson(JSONObject obj) throws JSONException {
	}

	public EngineResultTimes(Carton in) {
		int nrTimes = in.readInt();

		while (nrTimes-- > 0) {
			EngineResultTime time = new EngineResultTime(in);

			times.put(time.getId(), time);
		}
	}

	public void writeTo(Carton dest) {
		dest.writeInt(times.size());

		for (ResultTime time : times.values())
			((EngineResultTime) time).writeTo(dest);
	}
}