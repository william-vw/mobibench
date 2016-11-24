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

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.wrap.Carton;
import wvw.utils.timer.ResultTimes;

public class InferenceResults extends ExperimentResults {

	private List<String> inferred = new ArrayList<String>();

	public InferenceResults() {
	}

	public InferenceResults(ResultTimes resultTimes) {
		super(resultTimes);
	}

	public InferenceResults(ResultTimes resultTimes, List<String> inferred) {
		super(resultTimes);

		this.inferred = inferred;
	}

	public List<String> getInferred() {
		return inferred;
	}

	public void setInferred(List<String> inferred) {
		this.inferred = inferred;
	}

	protected boolean hasString() {
		return false;
	}

	protected String getString() {
		return null;
	}

	protected void setString(String dataStr) {
	}

	protected boolean hasList() {
		return true;
	}

	protected List<String> getList() {
		return inferred;
	}

	protected void setList(List<String> dataList) {
		this.inferred = dataList;
	}

	public void toJson(JSONObject obj) throws JSONException {
		super.toJson(obj);

		JSONArray infArray = new JSONArray();
		for (String inf : inferred)
			infArray.put(inf);

		obj.put("inferred", infArray);
	}

	public void fromJson(JSONObject obj) throws JSONException {
	}

	
	public InferenceResults(Carton in) {
		super(in);

		try {
			fromFile(in);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void writeTo(Carton dest) {
		super.writeTo(dest);

		try {
			toFile(dest);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
