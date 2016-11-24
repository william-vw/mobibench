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

import wvw.mobibench.timer.EngineResultTimes;
import wvw.mobibench.wrap.Carton;

public class EntailmentResults extends ExperimentResults {

	private boolean entails;

	public EntailmentResults() {}
	
	public EntailmentResults(EngineResultTimes resultTimes, boolean entails) {
		super(resultTimes);

		this.entails = entails;
	}

	public boolean isEntails() {
		return entails;
	}

	public void setEntails(boolean entails) {
		this.entails = entails;
	}

	public void toJson(JSONObject obj) throws JSONException {
		super.toJson(obj);

		obj.put("entails", entails);
	}

	public void fromJson(JSONObject obj) throws JSONException {
	}

	public EntailmentResults(Carton in) {
		super(in);

		setEntails(in.readInt() == 1);
	}

	public void writeTo(Carton dest) {
		super.writeTo(dest);

		dest.writeInt(entails ? 1 : 0);
	}
}
