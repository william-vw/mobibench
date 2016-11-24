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

package wvw.mobibench.analysis;

import wvw.utils.OutputUtils;

public class PerfOutput {

	private String engine;
	private String mainFlow = "frequent";
	private String task = "ontology_inference";
	private String subtask;
	private String scope = "full";
	private String[] selections;

	public PerfOutput() {
	}

	public PerfOutput(String engine, String subtask) {
		this.engine = engine;

		this.subtask = subtask;
	}

	public PerfOutput(String engine, String subtask, String[] selections) {
		this.engine = engine;

		this.subtask = subtask;
		this.selections = selections;
	}

	public PerfOutput(String engine, String subtask, String scope) {
		this.engine = engine;

		this.subtask = subtask;
		this.scope = scope;
	}

	public String getEngine() {
		return engine;
	}

	public String getMainFlow() {
		return mainFlow;
	}

	public String getTask() {
		return task;
	}

	public String getSubtask() {
		return subtask;
	}

	public String getScope() {
		return scope;
	}

	public String[] getSelections() {
		return selections;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public void setMainFlow(String mainFlow) {
		this.mainFlow = mainFlow;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public void setSubtask(String subtask) {
		this.subtask = subtask;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public void setSelections(String[] selections) {
		this.selections = selections;
	}

	public String getName() {
		if (subtask.equals("builtin"))
			return "[" + engine + "] builtin";

		else
			return "[" + engine + "] owl2rl>" + getSelStr(false);
	}

	public String getFile(String dataset, int version) {
		String path = engine + "/" + getSelStr(true) + "/" + mainFlow + "-" + task + "_" + subtask
				+ "-" + scope + "=";

		if (subtask.equals("builtin"))
			path += "all";
		else
			path += getSelStr(false);

		path += "-" + dataset + "_" + version + ".txt";

		return path;
	}

	private String getSelStr(boolean folder) {
		if (scope.startsWith("subset"))
			return scope;

		if (selections == null || selections[0].equals("full"))
			return "full";

		else {
			String str = OutputUtils.toString(selections);

			if (folder)
				return str.substring(1, str.length() - 1);
			else
				return str;
		}
	}
}
