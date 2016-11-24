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
import java.util.Iterator;
import java.util.List;

import wvw.utils.iterator.NullIfEmptyIterator;

public class RuleBasedServiceMatchConfig extends ServiceMatchConfig {

	private String subFlow;
	private List<String[]> selections = new ArrayList<String[]>();

	private String confTarget;

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

	public void select(String... selections) {
		this.selections.add(selections);
	}

	public void select(String[]... selections) {
		for (String[] selection : selections)
			this.selections.add(selection);
	}

	public List<String> getSelections() {
		if (selections.size() == 0)
			return new ArrayList<String>();

		List<String> ret = new ArrayList<String>();
		for (String selection : selections.get(0))
			ret.add(selection);
		
		return ret;
	}

	public List<RuleBasedServiceMatchConfig> genAtomConfigs() {
		List<RuleBasedServiceMatchConfig> configs = new ArrayList<RuleBasedServiceMatchConfig>();

		Iterator<OWLDataset> it1 = datasets.iterator();

		while (it1.hasNext()) {
			OWLDataset dataset = it1.next();

			Iterator<MatchDirections> it2 = directions.iterator();
			while (it2.hasNext()) {
				MatchDirections dir = it2.next();

				Iterator<String[]> it3 = new NullIfEmptyIterator<String[]>(
						selections);

				while (it3.hasNext()) {
					String[] selection = it3.next();

					RuleBasedServiceMatchConfig config = new RuleBasedServiceMatchConfig();
					config.init(engine, nrRuns, warmupRun, dumpHeap, mainFlow,
							subFlow, task, subTask, confTest, confTarget,
							outputInf, localPath, remotePath);

					config.addDatasets(dataset);
					config.addDirections(dir);

					if (selection != null)
						config.select(selection);

					configs.add(config);
				}
			}
		}

		return configs;
	}
}
