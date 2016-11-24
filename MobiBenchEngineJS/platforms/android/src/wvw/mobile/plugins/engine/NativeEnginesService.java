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
package wvw.mobile.plugins.engine;

import java.io.File;
import java.io.IOException;

import android.content.Intent;
import android.os.Environment;
import android.os.IBinder;
import wvw.mobibench.App;
import wvw.mobibench.PluginActions;
import wvw.mobibench.bg_task.BgTask;
import wvw.mobibench.config.data.DatasetConfigContainer;
import wvw.mobibench.config.engine.EngineConfig;
import wvw.mobibench.config.reason.ReasoningConfig;
import wvw.mobibench.config.rules.RulesetConfigContainer;
import wvw.mobibench.engine.ReasoningEngine;
import wvw.mobibench.exception.BenchmarkException;
import wvw.mobibench.exception.LoadingException;
import wvw.mobibench.loader.android.AndroidDependencyLoader;
import wvw.mobibench.results.ExperimentResults;
import wvw.mobibench.timer.EngineResultTimes;
import wvw.mobibench.wrap.Cartonable;
import wvw.mobibench.wrap.android.CParcelable;
import wvw.mobile.plugins.MobiBenchPluginService;
import wvw.utils.android.AndroidFileUtils;
import wvw.utils.log2.Log;
import wvw.utils.timer.ExperimentTimer;

public class NativeEnginesService extends MobiBenchPluginService {

	private Intent curIntent;
	private ReasoningEngine curEngine;

	private AndroidDependencyLoader dependencyLoader = new AndroidDependencyLoader();

	public void onCreate() {
		init();

		BgTask.addExceptionListener(this);
	}

	public int onStartCommand(Intent intent, int flags, int startId) {
		App.context = this;
		curIntent = intent;

		String action = intent.getAction();
		Log.d("NativeEnginesService.onStartCommand: " + action);

		ExperimentTimer timer = new ExperimentTimer("totalServiceCall");
		timer.begin();

		try {
			final String engineId = intent.getStringExtra("engineId");
			// String engineId = "AndroJena";

			loadEngine(engineId);

			if (action.equals(PluginActions.GET_ENGINE_CONFIG)) {
				EngineConfig engineConfig = curEngine.getEngineConfig();

				sendBack(intent, "engineConfig", engineConfig);

			} else if (action.equals(PluginActions.INIT)) {
				new BgTask() {
					protected void task() throws Exception {
						curEngine.init();

						sendBack(curIntent);
					}
				}.runTask();

			} else if (action.equals(PluginActions.RESET)) {
				new BgTask() {
					protected void task() throws Exception {
						curEngine.reset();

						sendBack(curIntent);
					}
				}.runTask();

			} else if (action.equals(PluginActions.DESTROY)) {
				new BgTask() {
					protected void task() throws Exception {
						curEngine.reset();
						stopSelf();

						sendBack(curIntent);
					}
				}.runTask();

			} else if (action.equals(PluginActions.LOAD_DATA)) {
				new BgTask() {
					protected void task() throws Exception {
						ReasoningConfig rConfig = get(curIntent, "rConfig");
						DatasetConfigContainer dataset = get(curIntent,
								"dataset");

						EngineResultTimes times = curEngine.loadData(rConfig,
								dataset);
						sendBack(curIntent, "times", times);
					}
				}.runTask();

			} else if (action.equals(PluginActions.EXECUTE_RULES)) {
				new BgTask() {
					protected void task() throws Exception {
						ReasoningConfig rConfig = get(curIntent, "rConfig");
						RulesetConfigContainer ruleset = get(curIntent,
								"ruleset");

						ExperimentResults results = curEngine
								.executeRules(rConfig, ruleset);
						sendBack(curIntent, "results", results);
					}
				}.runTask();

			} else if (action.equals(PluginActions.LOAD_RULES)) {
				new BgTask() {
					protected void task() throws Exception {
						ReasoningConfig rConfig = get(curIntent, "rConfig");
						RulesetConfigContainer ruleset = get(curIntent,
								"ruleset");

						EngineResultTimes times = curEngine.loadRules(rConfig,
								ruleset);
						sendBack(curIntent, "times", times);
					}
				}.runTask();

			} else if (action.equals(PluginActions.EXECUTE)) {
				new BgTask() {
					protected void task() throws Exception {
						ReasoningConfig rConfig = get(curIntent, "rConfig");

						ExperimentResults results = curEngine.execute(rConfig);
						sendBack(curIntent, "results", results);
					}
				}.runTask();

			} else if (action.equals(PluginActions.INFERENCE)) {
				new BgTask() {
					protected void task() throws Exception {
						ReasoningConfig rConfig = get(curIntent, "rConfig");
						DatasetConfigContainer ontology = get(curIntent,
								"ontology");

						ExperimentResults results = curEngine.inference(rConfig,
								ontology);
						sendBack(curIntent, "results", results);
					}
				}.runTask();

			} else if (action.equals(PluginActions.ENTAILS)) {
				new BgTask() {
					protected void task() throws Exception {
						ReasoningConfig rConfig = get(curIntent, "rConfig");

						DatasetConfigContainer service = get(curIntent,
								"service");
						DatasetConfigContainer goal = get(curIntent, "goal");

						ExperimentResults results = curEngine.entails(rConfig,
								service, goal);
						sendBack(curIntent, "results", results);
					}
				}.runTask();

			} else if (action.equals(PluginActions.DUMP_HEAP)) {
				new BgTask() {
					protected void task() throws Exception {
						try {
							String fileName = curIntent
									.getStringExtra("fileName");

							File folder = new File(
									Environment.getExternalStorageDirectory(),
									"Android/data/benchmarks/dumps/");
							folder.mkdirs();

							File dumpFile = new File(folder,
									fileName + ".hprof");

							String filePath = dumpFile.getAbsolutePath();
							Log.d("dumpFile: " + filePath);

							android.os.Debug.dumpHprofData(filePath);
							Log.d("dump done");
							AndroidFileUtils.showFile(filePath);

							sendBack(curIntent);

						} catch (IOException e) {
							e.printStackTrace();
						}
					}

				}.runTask();

			}

			timer.done();

			Log.d(timer.toString());

		} catch (BenchmarkException e) {
			onBgException(e);

		} catch (Exception e) {
			onBgException(e);
		}

		return START_NOT_STICKY;
	}

	@SuppressWarnings("unchecked")
	public <T extends Cartonable> T get(Intent i, String name) {
		CParcelable cp = i.getParcelableExtra(name);

		return (T) cp.getCartonable();
	}

	public IBinder onBind(Intent intent) {
		return null;
	}

	public void onDestroy() {
		Log.d("NativeEnginesService.onDestroy");
	}

	// switch between these two, depending on what class-loading mechanism
	// you want to use

	private void loadEngine(String engineId) throws LoadingException {
		curEngine = dependencyLoader.load(engineId);
	}

	// private void loadEngine(String engineId) throws LoadingException {
	// if (curEngine != null) {
	//
	// Log.d("curEngine: " + curEngine.getId() + " <> " + engineId);
	//
	// if (!curEngine.getId().equals(engineId))
	// throw new LoadingException(
	// "already loaded another engine - please restart");
	//
	// return;
	// }
	//
	// try {
	// Class<?> cls = Class.forName("wvw.mobibench.engine." + engineId);
	//
	// curEngine = (ReasoningEngine) cls.newInstance();
	//
	// } catch (Exception e) {
	// throw new LoadingException("Error loading ReasoningEngine instance",
	// e);
	// }
	// }

	public void onBgException(BenchmarkException e) {
		e.printStackTrace();

		sendBack(curIntent, e);
	}

	public void onBgException(Exception e) {
		e.printStackTrace();

		sendBack(curIntent, new BenchmarkException(e));
	}
}
