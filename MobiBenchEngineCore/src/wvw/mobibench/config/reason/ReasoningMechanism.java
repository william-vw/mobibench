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
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.config.ProcessFlows;
import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;

public class ReasoningMechanism implements Cartonable, JsonReadable,
		JsonWritable {

	private MechanismTypes type;

	private ProcessFlows mainFlow;
	private ProcessFlows subFlow;

	private List<ReasoningScope> scopes = new ArrayList<ReasoningScope>();

	public ReasoningMechanism(MechanismTypes type, ProcessFlows subFlow) {
		this.type = type;
		this.subFlow = subFlow;
	}

	public ReasoningMechanism(MechanismTypes type, ProcessFlows mainFlow,
			ProcessFlows subFlow) {

		this.type = type;
		
		this.mainFlow = mainFlow;
		this.subFlow = subFlow;
	}

	public ReasoningMechanism(MechanismTypes type) {
		this.type = type;
	}

	public MechanismTypes getType() {
		return type;
	}

	public void setType(MechanismTypes type) {
		this.type = type;
	}

	public ProcessFlows getMainFlow() {
		return mainFlow;
	}

	public void setMainFlow(ProcessFlows mainFlow) {
		this.mainFlow = mainFlow;
	}

	public ProcessFlows getSubFlow() {
		return subFlow;
	}

	public void setSubFlow(ProcessFlows subFlow) {
		this.subFlow = subFlow;
	}

	public void addScope(ReasoningScope scope) {
		scopes.add(scope);
	}

	public Iterator<ReasoningScope> getScopes() {
		return scopes.iterator();
	}

	public ReasoningMechanism(JSONObject obj) throws JSONException {
		fromJson(obj);
	}

	public void toJson(JSONObject obj) throws JSONException {
		if (type != null)
			obj.put("type", type.getLabel());

		if (mainFlow != null)
			obj.put("mainFlow", mainFlow.getLabel());

		if (subFlow != null)
			obj.put("subFlow", subFlow.getLabel());

		if (scopes.size() > 0) {
			JSONArray array = new JSONArray();
			obj.put("scopes", array);

			for (ReasoningScope scope : scopes) {
				JSONObject scopeObj = new JSONObject();
				scope.toJson(scopeObj);
				
				array.put(scopeObj);
			}
		}
	}

	public void fromJson(JSONObject obj) throws JSONException {
		if (obj.has("type"))
			setType(MechanismTypes.getEnum(obj.getString("type")));

		if (obj.has("mainFlow"))
			setMainFlow(ProcessFlows.getEnum(obj.getString("mainFlow")));

		if (obj.has("subFlow"))
			setSubFlow(ProcessFlows.getEnum(obj.getString("subFlow")));

		if (obj.has("scopes")) {
			JSONArray array = obj.getJSONArray("scopes");

			for (int i = 0; i < array.length(); i++)
				scopes.add(new ReasoningScope(array.getJSONObject(i)));
		}
	}

	public ReasoningMechanism(Carton in) {
		setType(MechanismTypes.getEnum(in.readInt()));

		setMainFlow(ProcessFlows.getEnum(in.readInt()));
		setSubFlow(ProcessFlows.getEnum(in.readInt()));

		int nrScopes = in.readInt();
		while (nrScopes-- > 0)
			scopes.add(new ReasoningScope(in));
	}

	public void writeTo(Carton dest) {
		dest.writeInt(type == null ? -1 : type.getId());

		dest.writeInt(mainFlow == null ? -1 : mainFlow.getId());
		dest.writeInt(subFlow == null ? -1 : subFlow.getId());

		dest.writeInt(scopes.size());

		for (ReasoningScope scope : scopes)
			scope.writeTo(dest);
	}
}
