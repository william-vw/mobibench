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
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import wvw.utils.iterator.NullIfEmptyIterator;
import wvw.utils.log2.Log;

public class OWL2RLRunConfig extends RunConfig {

	private String subFlow;

	private List<String[]> selections = new ArrayList<String[]>();
	private List<PreprocessOptions> preprocesses = new ArrayList<PreprocessOptions>();

	private String confTarget;

	public OWL2RLRunConfig() {
	}

	protected void init(String engine, int nrRuns, boolean warmupRun,
			boolean dumpHeap, String mainFlow, String subFlow, String task,
			String subTask, boolean confTest, String confTarget,
			boolean outputInf, String localPath, String remotePath) {

		super.init(engine, nrRuns, warmupRun, dumpHeap, mainFlow, task, subTask,
				confTest, outputInf, localPath, remotePath);

		this.subFlow = subFlow;
		this.confTarget = confTarget;
	}

	public String getSubFlow() {
		return subFlow;
	}

	public void setSubFlow(String subFlow) {
		this.subFlow = subFlow;
	}

	public void setFlow(String mainFlow, String subFlow) {
		this.mainFlow = mainFlow;

		this.subFlow = subFlow;
	}

	public void select(String... selections) {
		this.selections.add(selections);
	}

	public void select(String[]... selectionss) {
		for (String[] selections : selectionss)

			this.selections.add(selections);
	}

	public List<String> getSelections() {
		if (selections.size() == 0)
			return new ArrayList<String>();

		Log.d("??? " + selections);
		return Arrays.asList(selections.get(0));
	}

	public boolean hasPreprocess() {
		return preprocesses.size() > 0;
	}

	public PreprocessOptions getPreprocess() {
		return preprocesses.get(0);
	}

	public void preprocess(PreprocessOptions... preprocesses) {
		for (PreprocessOptions preprocess : preprocesses)

			this.preprocesses.add(preprocess);
	}

	public void setConfTarget(String confTarget) {
		this.confTarget = confTarget;
	}

	public String getConfTarget() {
		return confTarget;
	}

	public List<OWL2RLRunConfig> genAtomConfigs() {
		List<OWL2RLRunConfig> configs = new ArrayList<OWL2RLRunConfig>();

		Iterator<String[]> it1 = new NullIfEmptyIterator<String[]>(selections);
		while (it1.hasNext()) {
			String[] selection = it1.next();

			Iterator<PreprocessOptions> it2 = new NullIfEmptyIterator<PreprocessOptions>(
					preprocesses);

			while (it2.hasNext()) {
				PreprocessOptions preprocess = it2.next();

				OWL2RLRunConfig config = new OWL2RLRunConfig();

				config.init(engine, nrRuns, warmupRun, dumpHeap, mainFlow,
						subFlow, task, subTask, confTest, confTarget, outputInf,
						localPath, remotePath);

				config.setScopes(scopes);
				config.setDatasets(datasets);

				if (selection != null)
					config.select(selection);

				if (preprocess != null)
					config.preprocess(preprocess);

				configs.add(config);
			}
		}

		return configs;
	}
}