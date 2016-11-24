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

package wvw.mobibench.auto.factory.json;

import java.util.ArrayList;
import java.util.List;

import wvw.mobibench.run.config.MatchDirections;
import wvw.mobibench.run.config.OWL2RLRunConfig;
import wvw.mobibench.run.config.OWLBuiltinRunConfig;
import wvw.mobibench.run.config.OWLDataset;
import wvw.mobibench.run.config.OWLScope;
import wvw.mobibench.run.config.PreprocessOptions;
import wvw.mobibench.run.config.RuleBasedServiceMatchConfig;
import wvw.utils.StringUtils;
import wvw.utils.log2.Log;

public class DefaultJsonConfigFactory implements JsonConfigFactory {

	private static JsonConfigFactory instance = instance();

	public static JsonConfigFactory instance() {
		if (instance == null)
			instance = new DefaultJsonConfigFactory();

		return instance;
	}

	public List<String> json_OWL2RL(List<OWL2RLRunConfig> configs) {
		List<String> ret = new ArrayList<String>();

		for (OWL2RLRunConfig config : configs) {
			String reasonId1 = config.getMainFlow()
					+ "-ontology_inference_owl2rl";

			// @formatter:off
		String config1 = 
				"{" +
				"     \"engine\": \"" + config.getEngine() + "\",\n" +
				"     \"nrRuns\": \"" + config.getNrRuns() + "\",\n" +
				"     \"warmupRun\": " + config.getWarmupRun() + ",\n" +
				"     \"dumpHeap\": " + config.getDumpHeap() + ",\n" +
				"     \"reasoning\": {\n" +
				"         \"task\": \"ontology_inference\",\n" +
				"		  \"id\": <ID>,\n" +
				"		  <SCOPE>" +
				"         \"mechanism\": {\n" +
				"             \"ontology_inference\": {\n" +
				"                 \"type\": \"owl2rl\",\n" +
				"                 \"dependency\": \"rule_inference\"\n" +
				"             },\n" +
				"             \"rule_inference\": {\n" +
				"                 \"type\": \"builtin\",\n" +
				"                 \"subFlow\": \"" + config.getSubFlow() + "\",\n" +
				"                 \"mainFlow\": \"" + config.getMainFlow() + "\"\n" +
				"             }\n" +
				"         }\n" +
				"     },\n" + 
				"	  \"confTest\": " + config.confTest() + ",\n" + 
				"	  \"outputInf\": " + config.outputInf() + ",\n";
		// @formatter:on

			if (config.hasScopes()) {
				for (OWLScope scope : config.getScopes()) {

					if (scope.hasOptions()) {
						List<String> options = scope.getOptions();

						for (String option : options) {
							String reasonId2 = reasonId1 + "-" + scope + "_"
									+ option;

							// @formatter:off
						String config2 = config1.replace("<ID>", "\"" + reasonId2 + "\"")
								.replace("<SCOPE>",
										"		  \"scope\": {\n" +
										"		  		\"type\": \"" + scope + "\",\n" +
										"    			\"options\": [\n" +
										"    				\"" + option + "\"\n" +
										"    			]\n" +
										"		  },\n");
						// @formatter:on

							json_OWL2RL_resources(config, reasonId2, config2,
									ret);
						}

					} else {
						String reasonId2 = reasonId1 + "-" + scope;

						// @formatter:off
					String config2 = config1.replace("<ID>", "\"" + reasonId2 + "\"")
							.replace("<SCOPE>",
									"		  \"scope\": {\n" +
									"		  		\"type\": \"" + scope + "\",\n" +
									"		  		\"options\": []\n" +
									"		  },\n");
					// @formatter:on

						json_OWL2RL_resources(config, reasonId2, config2, ret);
					}
				}

			} else {
				String reasonId2 = reasonId1;
				String config2 = config1
						.replace("<ID>", "\"" + reasonId2 + "\"")
						.replace("<SCOPE>", "");

				json_OWL2RL_resources(config, reasonId2, config2, ret);
			}
		}

		Log.d("configs (# " + ret.size() + "):");

		for (String configStr : ret)
			Log.d(configStr.toString());

		return ret;
	}

	private void json_OWL2RL_resources(OWL2RLRunConfig config, String reasonId,
			String configStr, List<String> ret) {
		for (OWLDataset dataset : config.getDatasets()) {

			if (dataset.hasFiles()) {
				List<String> dataFiles = dataset.getFiles();

				for (String file : dataFiles)
					handleDataset(config, reasonId, configStr, dataset, file,
							ret);

			} else
				handleDataset(config, reasonId, configStr, dataset, null, ret);
		}
	}

	private void handleDataset(OWL2RLRunConfig config, String reasonId,
			String configStr, OWLDataset dataset, String file,
			List<String> ret) {

		List<String> selections = config.getSelections();

		String dataFolder = "res/owl/data/";

		String dataPath = null;
		if (file != null)
			dataPath = dataset.getDataPath() + "/" + file;
		else
			dataPath = dataset.getDataPath();

		String absPath = dataFolder + dataPath + ".nt";

		String dataSet = null;
		if (file != null)
			dataSet = dataset.getDataset() + "/" + file;
		else
			dataSet = dataset.getDataset();

		if (config.outputInf()) {
			String path = config.getRemotePath();
			path += "output/ontology_inference/owl2rl/";

			String name = null;
			if (selections.size() > 0)
				name = StringUtils.toString(selections, ",", "[", "]");
			else
				name = "full";

			if (config.hasPreprocess())
				name += "-" + config.getPreprocess();
			else
				name += "-none";

			path += dataSet + "/" + name + "-" + config.getEngine() + ".nt";

			configStr += "	\"outputPath\" : \"" + path + "\",\n";
		}

		if (config.confTest()) {
			String path = config.getLocalPath();
			path += "conf/ontology_inference/owl2rl/";

			String confTarget = config.getConfTarget();
			String name = (confTarget != null ? confTarget : "full");

			path += dataSet + "/" + name + ".nt";

			configStr += "	\"confPath\" : \"" + path + "\",\n";
		}

		String ontoConfig = null;
		if (config.getMainFlow().equals("frequent")) {
			// @formatter:off
			ontoConfig = 
					"     \"ontology\": {\n" +
					"         \"path\": \"" + absPath + "\",\n" +
					"         \"type\": \"data\",\n" +
					"         \"format\": \"RDF\",\n" +
					"         \"syntax\": \"N-TRIPLE\"\n" +	
					"     },\n";
			// @formatter:on

		} else {
			String absSinglePath = dataFolder + "single.nt";

			// @formatter:off
			ontoConfig = 
					"    \"ontology\": {\n" +
					"	 	\"baseline\": {\n" +
					"       	\"path\": \"" + absPath + "\",\n" +
					"       	\"type\": \"data\",\n" +
					"           \"format\": \"RDF\",\n" +
					"           \"syntax\": \"N-TRIPLE\"\n" +
					"		},\n" +
					"		\"single\": {\n" +
					"       	\"path\": \"" + absSinglePath + "\",\n" +
					"           \"type\": \"data\",\n" +
					"           \"format\": \"RDF\",\n" +
					"           \"syntax\": \"N-TRIPLE\"\n" +
					"		}\n" +
					"   },\n";
			// @formatter:on
		}

		String rulesPrefix = "res/owl/owl2rl/full/";

		String axiomsPath = rulesPrefix + "axioms.nt";
		String rulesPath = rulesPrefix + "rules.spin";

		String resId = null;
		if (selections.isEmpty())
			resId = "full";
		else
			resId = StringUtils.toString(selections, ",", "[", "]");

		String preprocessStr = "false";
		// String supportsCachingStr = "true";
		String supportsCachingStr = "false";

		if (config.hasPreprocess()) {
			PreprocessOptions preprocess = config.getPreprocess();

			resId += "-" + preprocess;
			preprocessStr = "\"" + preprocess.toString() + "\"";
			// supportsCachingStr = preprocess.supportsCaching() + "";

		} else
			resId += "-none";

		resId += "-" + dataset;
		if (file != null)
			resId += "_" + file;

		String id = reasonId + "=" + resId;
		String selStr = StringUtils.toString(selections, ",", "\"", "[", "]");

		// @formatter:off
		String jsonConfig = configStr +
				"     \"resources\": {\n" + ontoConfig +
				"         \"owl2rl\": {\n" +
				"             \"axioms\": {\n" +
				"                 \"path\": \"" + axiomsPath + "\",\n" +
				"                 \"type\": \"data\",\n" +
				"                 \"format\": \"RDF\",\n" +
				"                 \"syntax\": \"N-TRIPLE\"\n" +
				"             },\n" +
				"             \"rules\": {\n" +
				"                 \"path\": \"" + rulesPath + "\",\n" +
				"                 \"type\": \"rules\",\n" +
				"                 \"format\": \"SPIN\"\n" +
				"             },\n" +
				"			  \"selections\": " + selStr + ",\n" +
				"			  \"preprocess\": " + preprocessStr + ",\n" +
				"			  \"supportsCaching\": " + supportsCachingStr + "\n" +
				"         },\n" +
				"         \"id\": \"" + resId + "\"\n" +
				"     },\n" +
				"     \"id\": \"" + id + "\"\n" +
				" }\n";
		// @formatter:on

		ret.add(jsonConfig);
	}

	public List<String> json_OWLBuiltin(List<OWLBuiltinRunConfig> configs) {
		List<String> ret = new ArrayList<String>();

		for (OWLBuiltinRunConfig config : configs) {
			String reasonId1 = config.getMainFlow()
					+ "-ontology_inference_builtin";
		// @formatter:off
		String config1 = 
				"{" +
				"     \"engine\": \"" + config.getEngine() + "\",\n" +
				"     \"nrRuns\": \"" + config.getNrRuns() + "\",\n" +
				"     \"warmupRun\": " + config.getWarmupRun() + ",\n" +
				"     \"dumpHeap\": " + config.getDumpHeap() + ",\n" +
				"     \"reasoning\": {\n" +
				"         \"task\": \"ontology_inference\",\n" +
				"		  \"id\": <ID>,\n" +
				"		  <SCOPE>" +
				"         \"mechanism\": {\n" +
				"             \"ontology_inference\": {\n" +
				"                 \"type\": \"builtin\",\n" +
				"                 \"mainFlow\": \"" + config.getMainFlow() + "\"\n" +
				"             }\n" +
				"         }\n" +
				"     },\n" +
				"	  \"confTest\": " + config.confTest() + ",\n" + 
				"	  \"outputInf\": " + config.outputInf() + ",\n";
		// @formatter:on

			for (OWLScope scope : config.getScopes()) {

				if (scope.hasOptions()) {
					List<String> options = scope.getOptions();

					for (String option : options) {
						String reasonId2 = reasonId1 + "-" + scope + "_"
								+ option;

					// @formatter:off
					String config2 = config1.replace("<ID>", "\"" + reasonId2 + "\"").replace(
							"<SCOPE>",
							"		  \"scope\": {\n" +
							"		  		\"type\": \"" + scope + "\",\n" +
							"    			\"options\": [\n" +
							"    				\"" + option + "\"\n" +
							"    			]\n" +
							"		  },\n");
					// @formatter:on

						json_OWLBuiltin_resources(config, reasonId2, config2,
								ret);
					}

				} else {
					String reasonId2 = reasonId1 + "-" + scope;

				// @formatter:off
				String config2 = config1.replace("<ID>", "\"" + reasonId2 + "\"").replace(
						"<SCOPE>",
						"		  \"scope\": {\n" +
						"		  		\"type\": \"" + scope + "\",\n" +
						"		  		\"options\": []\n" +
						"		  },\n");
				// @formatter:on

					json_OWLBuiltin_resources(config, reasonId2, config2, ret);
				}
			}
		}

		Log.d("configs (# " + ret.size() + "):");

		for (String configStr : ret)
			Log.d(configStr);

		return ret;
	}

	private void json_OWLBuiltin_resources(OWLBuiltinRunConfig config,
			String reasonId, String orConfigStr, List<String> ret) {

		for (OWLDataset dataset : config.getDatasets()) {
			List<String> dataFiles = dataset.getFiles();
			
			for (String file : dataFiles) {
				String configStr = orConfigStr;

				String resId = "all-" + dataset + "_" + file;

				String dataFolder = "res/owl/data/" + dataset + "/";
				String dataPath = dataFolder + file + ".nt";

				String id = reasonId + "=" + resId;

				if (config.outputInf()) {
					String path = config.getRemotePath();
					path += "output/ontology_inference/builtin/";

					OWLScope scope = config.getScopes().get(0);

					path += dataset.getDataset() + "/" + file + "/";
					path += scope.getScope() + "-" + config.getEngine() + ".nt";

					configStr += "	\"outputPath\" : \"" + path + "\",\n";
				}

				if (config.confTest()) {
					String path = config.getLocalPath();
					path += "conf/ontology_inference/builtin/";

					OWLScope scope = config.getConfTarget();

					path += dataset.getDataset() + "/" + file + "/";
					path += scope.getScope() + ".nt";

					configStr += "	\"confPath\" : \"" + path + "\",\n";
				}

				String jsonConfig = null;
				// @formatter:off
				if (config.getMainFlow().equals("frequent")) {
					jsonConfig = configStr +
							"     \"resources\": {\n" +
							"         \"ontology\": {\n" +
							"             \"path\": \"" + dataPath + "\",\n" +
							"             \"type\": \"data\",\n" +
							"             \"format\": \"RDF\",\n" +
							"             \"syntax\": \"N-TRIPLE\"\n" +
							"         },\n" +
							"         \"id\": \"" + resId + "\"\n" +
							"     },\n" +
							"     \"id\": \"" + id + "\"\n" +
							" }\n";

				} else {
					String singlePath = dataFolder + "single.nt";

					jsonConfig = configStr +
							"     \"resources\": {\n" +
							"         \"ontology\": {\n" +
							"			  \"baseline\": {\n" +
							"             		\"path\": \"" + dataPath + "\",\n" +
							"             		\"type\": \"data\",\n" +
							"             		\"format\": \"RDF\",\n" +
							"             		\"syntax\": \"N-TRIPLE\"\n" +
							"			  },\n" +
							"		  	  \"single\": {\n" +
							"             		\"path\": \"" + singlePath + "\",\n" +
							"             		\"type\": \"data\",\n" +
							"             		\"format\": \"RDF\",\n" +
							"             		\"syntax\": \"N-TRIPLE\"\n" +
							"			  }\n" +
							"         },\n" +
							"         \"id\": \"" + resId + "\"\n" +
							"     },\n" +
							"     \"id\": \"" + id + "\"\n" +
							" }\n";
					// @formatter:on
				}

				ret.add(jsonConfig);
			}
		}
	}

	public List<String> json_ruleBasedServiceMatching(
			List<RuleBasedServiceMatchConfig> configs) {

		List<String> ret = new ArrayList<String>();

		for (RuleBasedServiceMatchConfig config : configs) {

			String reasonId1 = config.getMainFlow()
					+ "-service_match_rule_based";
		// @formatter:off
		String config1 = 
				"{\n" +
				"     \"engine\": \"" + config.getEngine() + "\",\n" +
				"     \"nrRuns\": \"" + config.getNrRuns() + "\",\n" +
				"     \"warmupRun\": " + config.getWarmupRun() + ",\n" +
				"     \"dumpHeap\": " + config.getDumpHeap() + ",\n" +
				"     \"reasoning\": {\n" +
				"         \"task\": \"service_match\",\n" +
				"         \"id\": <ID>,\n" +
				"		  <SCOPE>\n" +
				"         \"mechanism\": {\n" +
				"             \"service_match\": {\n" +
				"                 \"type\": \"rule_based\",\n" +
				"                 \"dependency\": \"rule_inference\"\n" +
				"             },\n" +
				"             \"rule_inference\": {\n" +
				"                 \"type\": \"builtin\",\n" +
				"                 \"subFlow\": \"" + config.getSubFlow() + "\",\n" +
				"                 \"mainFlow\": \"" + config.getMainFlow() + "\"\n" +
				"             }\n" +
				"         }\n" +
				"     },\n" +
				"	  \"testConf\": " + config.confTest() + ",\n" +
				"	  \"outputInf\": " + config.outputInf() + ",\n";
		
		if (config.outputInf())
			config1 += 	
				"	  \"outputPath\": <OUTPUT_PATH>,\n";
		// @formatter:on

			List<String> selections = config.getSelections();
			if (config.hasScopes()) {
				for (OWLScope scope : config.getScopes()) {

					if (scope.hasOptions()) {
						for (String option : scope.getOptions()) {
							String reasonId2 = reasonId1 + "-" + scope + "_"
									+ option;

						// @formatter:off
								String config2 = config1.replace("<ID>", "\"" + reasonId2 + "\"")
								.replace("<SCOPE>",
										"		  \"scope\": {\n" +
										"		  		\"type\": \"" + scope + "\",\n" +
										"    			\"options\": [\n" +
										"    				\"" + option + "\"\n" +
										"    			]\n" +
										"		  },\n");
						// @formatter:on

							json_ruleBasedServiceMatch_resources(config,
									reasonId2, config2, selections, ret);
						}

					} else {
						String reasonId2 = reasonId1 + "-" + scope;

					// @formatter:off
							String config2 = config1.replace("<ID>", "\"" + reasonId2 + "\"")
									.replace("<SCOPE>",
									"		  \"scope\": {\n" +
									"		  		\"type\": \"" + scope + "\",\n" +
									"		  		\"options\": []\n" +
									"		  },\n");
					// @formatter:on

						json_ruleBasedServiceMatch_resources(config, reasonId2,
								config2, selections, ret);
					}
				}

			} else {
				String reasonId2 = reasonId1;
				String config2 = config1
						.replace("<ID>", "\"" + reasonId2 + "\"")
						.replace("<SCOPE>", "");

				json_ruleBasedServiceMatch_resources(config, reasonId2, config2,
						selections, ret);
			}
		}

		Log.d("configs (# " + ret.size() + "):");

		for (String configStr : ret)
			Log.d(configStr);

		return ret;
	}

	private void json_ruleBasedServiceMatch_resources(
			RuleBasedServiceMatchConfig config, String reasonId,
			String configStr, List<String> selections, List<String> ret) {

		String root = "res/services/";
		for (MatchDirections dir : config.getDirections()) {

			String rulesSrcsRoot = null, axiomsSrcsRoot = null,
					targetRoot = null, resId = null;

			switch (dir) {

			case GOAL_SERVICE:
			case SERVICE_GOAL:
				String sourcesDir = null, targetsDir = null;

				switch (dir) {

				case GOAL_SERVICE:
					sourcesDir = "separate/queries";
					targetsDir = "separate/services";

					resId = "goal_service";

					break;

				case SERVICE_GOAL:
					sourcesDir = "separate/services";
					targetsDir = "separate/queries";

					resId = "service_goal";

					break;

				default:
					break;
				}

				rulesSrcsRoot = root + sourcesDir + "/source/";
				axiomsSrcsRoot = root + sourcesDir + "/source/";
				targetRoot = root + targetsDir + "/target/";

				break;

			case ALL_ALL:
				rulesSrcsRoot = root + "single/source/";
				axiomsSrcsRoot = root + "single/source/";
				targetRoot = root + "single/target/";

				resId = "all_all";

				break;
			}

			String rulesPrefix = null;
			boolean schema = false;

			List<String> orSelections = new ArrayList<String>(selections);
			if (selections.size() > 0) {
				String ruleset = selections.remove(0);
				rulesPrefix = "res/owl/owl2rl/" + ruleset + "/";

				schema = !(ruleset.equals("full"));
			}

			for (OWLDataset dataset : config.getDatasets()) {
				String datasetName = dataset.getDataset();

				if (schema)
					datasetName += "_schema";

				String selStr = StringUtils.toString(orSelections, ",", "[",
						"]");
				if (config.outputInf()) {
					String path = config.getRemotePath();

					path += "output/service_match/rule_based/";
					path += config.getEngine() + "/" + datasetName + "/"
							+ dir.toString().toLowerCase() + "-" + selStr
							+ ".nt";

					configStr = configStr.replace("<OUTPUT_PATH>",
							"\"" + path + "\"");
				}

				resId += "-" + selStr;

				String rulesSrcsPath = rulesSrcsRoot + datasetName + ".spin";
				String axiomsSrcsPath = axiomsSrcsRoot + datasetName + ".nt";
				String targetPath = targetRoot + datasetName + ".nt";

				// @formatter:off
				String jsonConfig = configStr +
						"     \"resources\": {\n" +
						"          \"sources\": {\n" +
						"               \"rules\": {\n" +
						"              		\"path\": \"" + rulesSrcsPath + "\",\n" +
						"              		\"type\": \"rules\",\n" +
						"              		\"format\": \"SPIN\",\n" +
						"              		\"composed\": true\n" +
						"          		},\n" + 
						"               \"axioms\": {\n" + 
						"              		\"path\": \"" + axiomsSrcsPath + "\",\n" +
						"              		\"type\": \"data\",\n" +
						"              		\"format\": \"RDF\",\n" +
						"              		\"syntax\": \"N-TRIPLE\",\n" +
						"              		\"composed\": true\n" + 
						"				}\n" + 
						"			},\n" +
						"           \"targets\": {\n" +
						"               \"path\": \"" + targetPath + "\",\n" +
						"               \"type\": \"data\",\n" +
						"               \"format\": \"RDF\",\n" +
						"              	\"syntax\": \"N-TRIPLE\",\n" +
						"              	\"composed\": true\n" +
						"          	},\n";
				// @formatter:on

				if (schema) {
					String axiomsPath = rulesPrefix + "axioms.nt";
					String rulesPath = rulesPrefix + "rules.spin";

					String selStr2 = StringUtils.toString(selections, ",", "[",
							"]");

					// @formatter:off
					jsonConfig +=
							"         \"owl2rl\": {\n" +
							"             \"axioms\": {\n" +
							"                 \"path\": \"" + axiomsPath + "\",\n" +
							"                 \"type\": \"data\",\n" +
							"                 \"format\": \"RDF\",\n" +
							"                 \"syntax\": \"N-TRIPLE\"\n" +
							"             },\n" +
							"             \"rules\": {\n" +
							"                 \"path\": \"" + rulesPath + "\",\n" +
							"                 \"type\": \"rules\",\n" +
							"                 \"format\": \"SPIN\"\n" +
							"             },\n" +
							"             \"selections\": " + selStr2 + "\n" +
							"         },\n";
					// @formatter:on
				}

				resId += "-" + dataset;
				String id = reasonId + "=" + resId;

				// @formatter:off
					jsonConfig +=
						"         \"id\": \"" + resId + "\"\n" +
						"     },\n" +
						"     \"id\": \"" + id + "\"\n" +
						" }\n";
				// @formatter:on

				ret.add(jsonConfig);
			}
		}
	}
}
