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

import java.util.Iterator;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.wrap.Carton;

public class ReasoningConfig extends MechanismContainer {

	private TaskTypes type;
	private ReasoningScope scope;

	public ReasoningConfig() {
	}

	public TaskTypes getType() {
		return type;
	}

	public void setType(TaskTypes type) {
		this.type = type;
	}

	public boolean hasScope() {
		return scope != null;
	}

	public ReasoningScope getScope() {
		return scope;
	}

	public void setScope(ReasoningScope scope) {
		this.scope = scope;
	}

	public void addMechanism(TaskTypes type, ReasoningMechanism mechanism) {
		mechanisms.put(type, mechanism);
	}

	public Iterator<TaskTypes> getMechanismReasonTypes() {
		return mechanisms.keySet().iterator();
	}

	public ReasoningMechanism getMechanism(TaskTypes type) {
		return mechanisms.get(type);
	}

	public ReasoningConfig(JSONObject obj) throws JSONException {
		fromJson(obj);
	}

	public void toJson(JSONObject obj) throws JSONException {
		obj.put("type", type.getLabel());

		if (scope != null) {
			JSONObject scopeObj = new JSONObject();
			scope.toJson(scopeObj);

			obj.put("scope", scopeObj);
		}
		
		super.toJson(obj);
	}

	public void fromJson(JSONObject obj) throws JSONException {		
		setType(TaskTypes.getEnum(obj.getString("task")));

		if (obj.has("scope"))
			setScope(new ReasoningScope(obj));
		
		super.fromJson(obj);
	}

	public ReasoningConfig(Carton in) {
		super(in);
		
		setType(TaskTypes.getEnum(in.readInt()));

		int hasScope = in.readInt();
		if (hasScope == 1)
			setScope(new ReasoningScope(in));
	}

	public void writeTo(Carton dest) {
		super.writeTo(dest);
		
		dest.writeInt(type.getId());

		if (scope != null) {
			dest.writeInt(1);

			scope.writeTo(dest);

		} else
			dest.writeInt(-1);
	}
}
