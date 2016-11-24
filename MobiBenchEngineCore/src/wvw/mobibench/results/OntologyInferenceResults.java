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

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.timer.EngineResultTimes;
import wvw.mobibench.wrap.Carton;

public class OntologyInferenceResults extends InferenceResults {

	private boolean consistent;
	private String conflicts;

	public OntologyInferenceResults() {
	}

	public OntologyInferenceResults(EngineResultTimes resultTimes) {
		super(resultTimes);
	}

	public OntologyInferenceResults(EngineResultTimes resultTimes,
			List<String> inferred, boolean consistent, String conflicts) {

		super(resultTimes, inferred);

		this.consistent = consistent;
		this.conflicts = conflicts;
	}

	public boolean isConsistent() {
		return consistent;
	}

	public void setConsistent(boolean consistent) {
		this.consistent = consistent;
	}

	public String getConflicts() {
		return conflicts;
	}

	public void setConflicts(String conflicts) {
		this.conflicts = conflicts;
	}

	public void toJson(JSONObject obj) throws JSONException {
		super.toJson(obj);

		obj.put("consistent", consistent);
		obj.put("conflicts", conflicts);
	}

	public void fromJson(JSONObject obj) throws JSONException {
	}

	public OntologyInferenceResults(Carton in) {
		super(in);

		setConsistent(in.readInt() == 1);
		setConflicts(in.readString());
	}

	public void writeTo(Carton dest) {
		super.writeTo(dest);

		dest.writeInt(consistent ? 1 : 0);
		dest.writeString(conflicts);
	}
}
