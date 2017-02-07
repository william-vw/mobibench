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

package wvw.mobibench.auto;

import java.util.ArrayList;
import java.util.List;

import wvw.mobibench.auto.factory.json.DefaultJsonConfigFactory;
import wvw.mobibench.auto.factory.json.JsonConfigFactory;
import wvw.mobibench.auto.factory.user.DefaultUserConfigFactory;
import wvw.mobibench.auto.factory.user.UserConfigFactory;
import wvw.mobibench.run.config.OWL2RLRunConfig;
import wvw.mobibench.run.config.OWLBuiltinRunConfig;
import wvw.mobibench.run.config.RuleBasedServiceMatchConfig;
import wvw.utils.log2.Log;

public abstract class AutoBenchmark {

	private long sleepTime = 10000;
	private String localPath = "res/owl/";
	// IMPORTANT update this path to suit your machine
	private String remotePath = "C:/Users/William/git/mobibench/MobiBenchEngineJS/www/res/owl/";

	private UserConfigFactory userFactory = new DefaultUserConfigFactory();
	private JsonConfigFactory jsonFactory = new DefaultJsonConfigFactory();

	private int idx = 0;
	private List<String> configs = new ArrayList<String>();

	public AutoBenchmark() {
		init();
	}

	public AutoBenchmark(long sleepTime) {
		this.sleepTime = sleepTime;

		init();
	}

	private void init() {
		userFactory.setLocalPath(localPath);

		userFactory.setRemotePath(remotePath);
	}

	public void run() {
		// run_OWL2RL();
		run_OWL2Builtin();
		// run_ruleBasedServiceMatching();
	}

	public void run_OWL2RL() {
		List<OWL2RLRunConfig> configs = userFactory.user_OWL2RL();
		this.configs = jsonFactory.json_OWL2RL(configs);

		benchmarkNext();
	}

	public void run_OWL2Builtin() {
		List<OWLBuiltinRunConfig> config = userFactory.user_OWLBuiltin();
		this.configs = jsonFactory.json_OWLBuiltin(config);

		benchmarkNext();
	}

	public void run_ruleBasedServiceMatching() {
		List<RuleBasedServiceMatchConfig> config = userFactory.user_ruleBasedServiceMatching();

		this.configs = jsonFactory.json_ruleBasedServiceMatching(config);

		benchmarkNext();
	}

	protected void benchmarkNext() {
		if (idx < configs.size()) {
			if (idx > 0)
				try {
					Log.d("auto: waiting " + sleepTime + " before next benchmark");

					Thread.sleep(sleepTime);

				} catch (InterruptedException e) {
					e.printStackTrace();
				}

			Log.d("auto: running config: " + idx);

			String config = configs.get(idx++);
			doBenchmark(config);

		} else {
			Log.d("auto: all benchmarks done");

			idx = 0;
			configs.clear();

			allDone();
		}
	}

	// NOTE should call benchmarkNext when done
	protected abstract void doBenchmark(String config);

	protected abstract void allDone();
}
