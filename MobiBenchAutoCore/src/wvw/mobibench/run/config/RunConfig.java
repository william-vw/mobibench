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
package wvw.mobibench.run.config;

import java.util.ArrayList;
import java.util.List;

public class RunConfig {

	protected String engine;

	protected int nrRuns = 10;
	protected boolean warmupRun;

	protected boolean dumpHeap;

	protected String mainFlow;

	protected String task;
	protected String subTask;

	protected List<OWLScope> scopes = new ArrayList<OWLScope>();
	protected List<OWLDataset> datasets = new ArrayList<OWLDataset>();

	protected boolean confTest = false;
	protected boolean outputInf = false;

	protected String localPath = null;
	protected String remotePath = null;

	public RunConfig() {
	}

	protected void init(String engine, int nrRuns, boolean warmupRun,
			boolean dumpHeap, String mainFlow, String task, String subTask,
			boolean confTest, boolean outputInf, String localPath,
			String remotePath) {

		this.engine = engine;
		this.nrRuns = nrRuns;
		this.warmupRun = warmupRun;
		this.dumpHeap = dumpHeap;
		this.mainFlow = mainFlow;
		this.task = task;
		this.subTask = subTask;
		this.confTest = confTest;
		this.outputInf = outputInf;
		this.localPath = localPath;
		this.remotePath = remotePath;
	}

	public String getEngine() {
		return engine;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public int getNrRuns() {
		return nrRuns;
	}

	public void setNrRuns(int nrRuns) {
		this.nrRuns = nrRuns;
	}

	public boolean getWarmupRun() {
		return warmupRun;
	}

	public void setWarmupRun(boolean warmupRun) {
		this.warmupRun = warmupRun;
	}

	public boolean getDumpHeap() {
		return dumpHeap;
	}

	public void setDumpHeap(boolean dumpHeap) {
		this.dumpHeap = dumpHeap;
	}

	public String getMainFlow() {
		return mainFlow;
	}

	public void setMainFlow(String mainFlow) {
		this.mainFlow = mainFlow;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public void setTask(String task, String subTask) {
		this.task = task;

		this.subTask = subTask;
	}

	public String getSubTask() {
		return subTask;
	}

	public void setSubTask(String subTask) {
		this.subTask = subTask;
	}

	public boolean hasScopes() {
		return !scopes.isEmpty();
	}

	public List<OWLScope> getScopes() {
		return scopes;
	}

	public void setScopes(List<OWLScope> scopes) {
		this.scopes = scopes;
	}

	public void addScope(OWLScope scope) {
		this.scopes.add(scope);
	}

	public List<OWLDataset> getDatasets() {
		return datasets;
	}

	public void setDatasets(List<OWLDataset> datasets) {
		this.datasets = datasets;
	}

	public void addDatasets(OWLDataset... datasets) {
		for (OWLDataset dataset : datasets)
			this.datasets.add(dataset);
	}

	public boolean confTest() {
		return confTest;
	}

	public void setConfTest(boolean confTest) {
		this.confTest = confTest;
	}

	public boolean outputInf() {
		return outputInf;
	}

	public void setOutputInf(boolean outputInf) {
		this.outputInf = outputInf;
	}

	public String getLocalPath() {
		return localPath;
	}

	public void setLocalPath(String localPath) {
		this.localPath = localPath;
	}

	public String getRemotePath() {
		return remotePath;
	}

	public void setRemotePath(String remotePath) {
		this.remotePath = remotePath;
	}
}
