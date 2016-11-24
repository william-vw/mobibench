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
package wvw.mobibench.engine;

import java.util.Iterator;

import wvw.mobibench.config.data.DatasetConfigContainer;
import wvw.mobibench.config.engine.EngineConfig;
import wvw.mobibench.config.reason.ReasoningConfig;
import wvw.mobibench.config.rules.RulesetConfigContainer;
import wvw.mobibench.exception.BenchmarkException;
import wvw.mobibench.results.ExperimentResults;
import wvw.mobibench.timer.EngineResultTimes;

public abstract class ReasoningEngine {

	private String id;
	private EngineConfig engineConfig;

	public ReasoningEngine(String id) {
		this.id = id;

		this.engineConfig = createEngineConfig();
	}

	public String getId() {
		return id;
	}

	protected abstract EngineConfig createEngineConfig();

	public EngineConfig getEngineConfig() {
		return engineConfig;
	}

	public void setEngineConfig(EngineConfig engineConfig) {
		this.engineConfig = engineConfig;
	}

	public abstract void init();

	public abstract void reset();

	public abstract EngineResultTimes loadData(ReasoningConfig rConfig,
			DatasetConfigContainer dataset) throws BenchmarkException;

	public abstract ExperimentResults executeRules(ReasoningConfig rConfig,
			RulesetConfigContainer ruleset) throws BenchmarkException;

	public abstract EngineResultTimes loadRules(ReasoningConfig rConfig,
			RulesetConfigContainer ruleset) throws BenchmarkException;

	public abstract ExperimentResults execute(ReasoningConfig rConfig)
			throws BenchmarkException;

	public abstract ExperimentResults inference(ReasoningConfig rConfig,
			DatasetConfigContainer ontology) throws BenchmarkException;

	public abstract ExperimentResults entails(ReasoningConfig rConfig,
			DatasetConfigContainer service, DatasetConfigContainer goal)
			throws BenchmarkException;

	protected String print(Iterator<?> i) {
		String str = "";

		if (i.hasNext())

			while (i.hasNext())
				str += i.next() + "\n";

		return str;
	}
}
