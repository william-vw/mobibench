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

package wvw.mobibench.call.plugins;

import java.io.File;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.MobiBenchEnginePc;
import wvw.mobibench.config.data.DatasetConfigContainer;
import wvw.mobibench.config.engine.EngineConfig;
import wvw.mobibench.config.reason.ReasoningConfig;
import wvw.mobibench.config.rules.RulesetConfigContainer;
import wvw.mobibench.engine.ReasoningEngine;
import wvw.mobibench.exception.BenchmarkException;
import wvw.mobibench.exception.LoadingException;
import wvw.mobibench.loader.EngineDependencyLoader;
import wvw.mobibench.loader.pc.PcDependencyLoader;
import wvw.mobibench.results.ExperimentResults;
import wvw.mobibench.timer.EngineResultTimes;
import wvw.utils.log2.Log;
import wvw.utils.pc.HeapDumper;

public class NativeEnginesPlugin {

	private static ReasoningEngine curEngine;
	private static EngineDependencyLoader dependencyLoader = new PcDependencyLoader();

	private static void loadEngine(String engineId) {
		try {
			curEngine = dependencyLoader.load(engineId);

		} catch (LoadingException e) {
			e.printStackTrace();
		}
	}

	public static String getEngineConfig(String engineId) {
		loadEngine(engineId);

		JSONObject obj = new JSONObject();

		EngineConfig config = curEngine.getEngineConfig();
		config.toJson(obj);

		return obj.toString();
	}

	public static void init(String engineId) {
		loadEngine(engineId);

		curEngine.init();
	}

	public static void reset(String engineId) {
		loadEngine(engineId);

		curEngine.reset();
	}

	public static void destroy(String engineId) {
		loadEngine(engineId);

		curEngine.reset();
	}

	public static String loadData(String engineId, String rConfig,
			String dataset) {
		
		loadEngine(engineId);

		JSONObject obj1 = new JSONObject(rConfig);
		JSONObject obj2 = new JSONObject(dataset);

		JSONObject ret = new JSONObject();

		try {
			EngineResultTimes times = curEngine.loadData(
					new ReasoningConfig(obj1),
					new DatasetConfigContainer(obj2));
			times.toJson(ret);

			return ret.toString();

		} catch (JSONException | BenchmarkException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static String executeRules(String engineId, String rConfig,
			String ruleset) {
		loadEngine(engineId);

		JSONObject obj1 = new JSONObject(rConfig);
		JSONObject obj2 = new JSONObject(ruleset);

		JSONObject ret = new JSONObject();

		try {
			ExperimentResults results = curEngine.executeRules(
					new ReasoningConfig(obj1),
					new RulesetConfigContainer(obj2));

			results.toJson(ret);

			return ret.toString();

		} catch (JSONException | BenchmarkException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static String loadRules(String engineId, String rConfig,
			String ruleset) {
		loadEngine(engineId);

		JSONObject obj1 = new JSONObject(rConfig);
		JSONObject obj2 = new JSONObject(ruleset);

		JSONObject ret = new JSONObject();

		try {
			EngineResultTimes times = curEngine.loadRules(
					new ReasoningConfig(obj1),
					new RulesetConfigContainer(obj2));
			times.toJson(ret);

			return ret.toString();

		} catch (JSONException | BenchmarkException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static String execute(String engineId, String rConfig) {
		loadEngine(engineId);

		JSONObject obj1 = new JSONObject(rConfig);

		JSONObject ret = new JSONObject();

		try {
			ExperimentResults results = curEngine
					.execute(new ReasoningConfig(obj1));
			results.toJson(ret);

			return ret.toString();

		} catch (JSONException | BenchmarkException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static String inference(String engineId, String rConfig,
			String ontology) {
		loadEngine(engineId);

		JSONObject obj1 = new JSONObject(rConfig);
		JSONObject obj2 = new JSONObject(ontology);

		JSONObject ret = new JSONObject();

		try {
			ExperimentResults results = curEngine.inference(
					new ReasoningConfig(obj1),
					new DatasetConfigContainer(obj2));

			results.toJson(ret);

			return ret.toString();

		} catch (JSONException | BenchmarkException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static String entails(String engineId, Object rConfig,
			String service, String goal) {
		loadEngine(engineId);

		JSONObject obj1 = new JSONObject(rConfig);
		JSONObject obj2 = new JSONObject(service);
		JSONObject obj3 = new JSONObject(goal);

		JSONObject ret = new JSONObject();

		try {
			ExperimentResults results = curEngine.entails(
					new ReasoningConfig(obj1), new DatasetConfigContainer(obj2),
					new DatasetConfigContainer(obj3));

			results.toJson(ret);

			return ret.toString();

		} catch (JSONException | BenchmarkException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static void dumpHeap(String engineId, String fileName) {
		loadEngine(engineId);

		File folder = new File(MobiBenchEnginePc.rootPath + "dumps/");
		folder.mkdirs();

		File dumpFile = new File(folder, fileName + ".hprof");

		Log.d("dumpFile: " + dumpFile);
		HeapDumper.dumpHeap(dumpFile.getAbsolutePath(), false);

		Log.d("dump done");
	}
}
