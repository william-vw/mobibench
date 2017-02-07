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

package wvw.mobibench.auto.factory.user;

import java.util.ArrayList;
import java.util.List;

import wvw.mobibench.run.config.MatchDirections;
import wvw.mobibench.run.config.OWL2RLRunConfig;
import wvw.mobibench.run.config.OWLBuiltinRunConfig;
import wvw.mobibench.run.config.OWLDataset;
import wvw.mobibench.run.config.OWLScope;
import wvw.mobibench.run.config.PreprocessOptions;
import wvw.mobibench.run.config.RuleBasedServiceMatchConfig;

public class DefaultUserConfigFactory extends UserConfigFactory {

	private static UserConfigFactory instance = instance();

	public static UserConfigFactory instance() {
		if (instance == null)
			instance = new DefaultUserConfigFactory();

		return instance;
	}

	public List<OWL2RLRunConfig> user_OWL2RL() {
		List<OWL2RLRunConfig> configs = new ArrayList<OWL2RLRunConfig>();

		OWL2RLRunConfig config = new OWL2RLRunConfig();

		config.setLocalPath(localPath);
		config.setRemotePath(remotePath);

		config.setEngine("androjena");

		config.setNrRuns(1);
		config.setWarmupRun(false);

		config.setDumpHeap(false);

		// config.addScope(new OWLScope("full",
		// new String[] { "StratifiedBottomUpNaive" }));
		config.setMainFlow("frequent");

		config.setSubFlow("load_data_exec_rules");
		// config.setSubFlow("load_rules_data_exec");

		config.setTask("ontology_inference");
		config.setSubTask("owl2rl");

		config.preprocess(PreprocessOptions.AUX_RULES);
		// config.preprocess(PreprocessOptions.INST_ALL_RULES);

		config.setOutputInf(true);
		config.setOutputRules(true);

		// > conformance testing
		// config.setConfTest(true);
		// config.setConfTarget("full");
		//
		// config.addDatasets(new OWLDataset("conf", new String[] { "full" }));

		// > full / inf-inst
		config.setConfTest(true);
		config.setConfTarget("full");

		// - regular dataset
		config.addDatasets(new OWLDataset("ore-small", 0, 188));

		// // without any selection
		// with below selections
		// config.select(new String[] { "entailed" },
		// new String[] { "entailed", "extra-axioms", "gener-rules" },
		// new String[] { "entailed", "domain-based" },
		// new String[] { "entailed", "ineff" });

		// - inf-schema dataset
		// config.addDatasets(new OWLDataset("ore-small", "mat-schema", new
		// Integer[] { 110 }));

		// config.select("inf-inst");

		// config.select(new String[] { "inf-inst", "entailed", "extra-axioms",
		// "gener-rules" });
		// config.select(new String[] { "inf-inst" },
		// new String[] { "inf-inst", "entailed" },
		// new String[] { "inf-inst", "entailed", "domain-based" });

		// config.addDatasets(
		// new OWLDataset("ore-small", "mat-schema_inst-ent", 0, 188));
		//
		// config.select(new String[] { "inf-inst", "entailed", "ineff" });

		// > inf-schema
		// config.setConfTest(false);
		// // config.setConfTarget("inf-schema");
		//
		// config.addDatasets(new OWLDataset("ore-small", 94, 188));
		// config.select(new String[] { "inf-schema", "domain-based" });

		// > consist
		// config.setConfTest(false);
		// // config.setConfTarget("consist");
		//
		// config.addDatasets(new OWLDataset("ore-small", "mat-inst", 0, 188));
		// config.select("consist", "gener-rules");

		// - some example setups

		// config.select("entailed");
		// config.addDatasets(new OWLDataset("ore-small", 0, 0));

		// config.select(new String[] { "entailed", "domain-based" });
		// config.addDatasets(new OWLDataset("ore-small", 0, 20));

		// config.select("consist", "gener-rules");
		// config.addDatasets(new OWLDataset("ore-small", "mat-inst", 0, 0));

		// config.select(new String[] { "inf-inst", "entailed", "domain-based"
		// });
		// config.addDatasets(new OWLDataset("ore-small", "mat-schema", 0, 0));

		configs.addAll(config.genAtomConfigs());

		return configs;
	}

	public List<OWLBuiltinRunConfig> user_OWLBuiltin() {
		List<OWLBuiltinRunConfig> configs = new ArrayList<OWLBuiltinRunConfig>();

		OWLBuiltinRunConfig config = new OWLBuiltinRunConfig();

		config.setEngine("hermit");

		config.setNrRuns(1);
		config.setWarmupRun(false);

		config.setDumpHeap(false);

		config.setMainFlow("frequent");

		config.setTask("ontology_inference");
		config.setSubTask("builtin");

		config.addScope(new OWLScope("full"));
		// config.addScope(new OWLScope("owl", new String[] { "default" }));
		config.addDatasets(new OWLDataset("ore-small", new Integer[] { 97, 124 }));

		config.setLocalPath(localPath);
		config.setRemotePath(remotePath);

		config.setOutputInf(true);

		// config.setConfTest(true);
		// config.setConfTarget(new OWLScope("full"));

		configs.add(config);

		return configs;
	}

	public List<RuleBasedServiceMatchConfig> user_ruleBasedServiceMatching() {
		RuleBasedServiceMatchConfig config = new RuleBasedServiceMatchConfig();

		config.setEngine("androjena");

		config.setNrRuns(1);
		config.setWarmupRun(false);

		config.setDumpHeap(false);

		config.setMainFlow("frequent");

		config.setSubFlow("load_data_exec_rules");
		// config.setSubFlow("load_rules_data_exec");

		config.setTask("service_match");
		config.setSubTask("rule_based");

		config.addDatasets(new OWLDataset("precond"), new OWLDataset("effect"));

		config.addDirections(MatchDirections.GOAL_SERVICE, MatchDirections.SERVICE_GOAL);

		// TODO first "selection" indicates the ruleset (e.g., "full", "custom",
		// "service-based")

		config.select(new String[] { "service-based", "entailed" },
				new String[] { "service-based", "entailed", "inst-ent", "ineff" });

		config.setLocalPath(localPath);
		config.setRemotePath(remotePath);

		config.setOutputInf(true);

		return config.genAtomConfigs();
	}
}
