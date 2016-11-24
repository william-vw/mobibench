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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;

public class ReasoningScope implements Cartonable, JsonReadable,
		JsonWritable {

	private ScopeTypes scope;
	private List<ReasoningOption> options = new ArrayList<ReasoningOption>();

	public ReasoningScope(ScopeTypes scope, ReasoningOption... options) {
		this.scope = scope;
		this.options = Arrays.asList(options);
	}

	public ScopeTypes getType() {
		return scope;
	}

	public void setScope(ScopeTypes scope) {
		this.scope = scope;
	}

	public boolean hasOptions() {
		return !options.isEmpty();
	}

	public Iterator<ReasoningOption> getOptions() {
		return options.iterator();
	}

	public void setOptions(List<ReasoningOption> options) {
		this.options = options;
	}
	
	public String toString() {
		return scope + " " + options;
	}

	public ReasoningScope(JSONObject obj) throws JSONException {
		fromJson(obj);
	}

	public void toJson(JSONObject obj) throws JSONException {
		obj.put("type", scope.getLabel());

		JSONArray array = new JSONArray();
		obj.put("options", array);

		for (ReasoningOption option : options)
			array.put(option.getLabel());
	}

	public void fromJson(JSONObject container) throws JSONException {
		Object obj = container.get("scope");
		if (obj instanceof String) 					
			setScope(getScope((String) obj));

		else {
			JSONObject scopeObj = container.getJSONObject("scope");
			setScope(getScope(scopeObj.getString("type")));

			JSONArray array = scopeObj.getJSONArray("options");
			for (int i = 0; i < array.length(); i++)
				options.add(new ReasoningOption(array.getString(i)));
		}
	}
	
	private ScopeTypes getScope(String str) throws JSONException {
		ScopeTypes scope = ScopeTypes.getEnum(str);
		
		if (scope == null)
			throw new JSONException("Unknown scope: " + str);
		
		return scope;
	}

	public ReasoningScope(Carton in) {
		setScope(ScopeTypes.getEnum(in.readInt()));

		int nrOptions = in.readInt();
		while (nrOptions-- > 0)
			options.add(new ReasoningOption(in.readString()));
	}

	public void writeTo(Carton dest) {
		dest.writeInt(scope.getId());

		dest.writeInt(options.size());
		for (ReasoningOption option : options)
			dest.writeString(option.getLabel());
	}
}
