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
package wvw.mobibench.results;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.parcel.DataParcel;
import wvw.mobibench.timer.EngineResultTimes;
import wvw.mobibench.wrap.Carton;
import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;
import wvw.utils.timer.ResultTimes;

public abstract class ExperimentResults extends DataParcel implements JsonReadable, JsonWritable {

	private EngineResultTimes resultTimes;

	public ExperimentResults() {}
	
	public ExperimentResults(ResultTimes resultTimes) {
		this.resultTimes = (EngineResultTimes) resultTimes;
	}

	public ResultTimes getResultTimes() {
		return resultTimes;
	}

	public void setResultTimes(ResultTimes resultTimes) {
		this.resultTimes = (EngineResultTimes) resultTimes;
	}

	public void toJson(JSONObject obj) throws JSONException {
		JSONObject timesObj = new JSONObject();
		resultTimes.toJson(timesObj);

		obj.put("resultTimes", timesObj);
	}

	public void fromJson(JSONObject obj) throws JSONException {
	}

	public ExperimentResults(Carton in) {
		resultTimes = new EngineResultTimes(in);
	}

	public void writeTo(Carton dest) {
		resultTimes.writeTo(dest);
	}
}