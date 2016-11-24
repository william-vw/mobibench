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

import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import wvw.mobibench.App;
import wvw.mobibench.PluginActions;
import wvw.mobibench.config.data.DatasetConfigContainer;
import wvw.mobibench.config.reason.ReasoningConfig;
import wvw.mobibench.config.rules.RulesetConfigContainer;
import wvw.mobibench.wrap.android.CParcelable;
import wvw.mobile.plugins.MobiBenchPlugin;
import wvw.utils.log2.Log;

public class NativeEnginesPlugin extends MobiBenchPlugin {

	private CallbackContext curCbCtx;
	private ResponseReceiver responseReceiver = null;

	private String nrArgs_errMsg = "Method '%s' expects %d argument(s): %s";

	public boolean execute(String action, JSONArray args, CallbackContext cbCtx) throws JSONException {
		App.init(this.cordova.getActivity());

		try {
			if (action.equals("getEngineConfig")) {

				if (args.length() != 1)
					cbCtx.error(String.format(nrArgs_errMsg, "getEngineConfig", 1, "engineId"));

				else {
					String engineId = args.getString(0);
					Log.d("NativeEnginesPlugin.getEngine" + "Config: " + engineId);

					plugin_getEngineConfig(engineId, cbCtx);
				}

			} else if (action.equals("init")) {

				if (args.length() != 1)
					cbCtx.error(String.format(nrArgs_errMsg, "init", 1, "engineId"));

				else {
					String engineId = args.getString(0);
					Log.d("NativeEnginesPlugin.init: " + engineId);

					plugin_init(engineId, cbCtx);
				}

			} else if (action.equals("reset")) {

				if (args.length() != 1)
					cbCtx.error(String.format(nrArgs_errMsg, "reset", 1, "engineId"));

				else {
					String engineId = args.getString(0);
					Log.d("NativeEnginesPlugin.reset: " + engineId);

					plugin_reset(engineId, cbCtx);
				}

			} else if (action.equals("destroy")) {

				if (args.length() != 1)
					cbCtx.error(String.format(nrArgs_errMsg, "destroy", 1, "engineId"));

				else {
					String engineId = args.getString(0);
					Log.d("NativeEnginesPlugin.destroy: " + engineId);

					plugin_destroy(engineId, cbCtx);
				}

			} else if (action.equals("loadData")) {

				if (args.length() != 3)
					cbCtx.error(String.format(nrArgs_errMsg, "loadData", 3, "engineId, rConfig, dataset"));

				else {
					String engineId = args.getString(0);

					ReasoningConfig rConfig = new ReasoningConfig(args.getJSONObject(1));
					DatasetConfigContainer dataset = new DatasetConfigContainer(args.getJSONObject(2));

					Log.d("NativeEnginesPlugin.loadData: " + engineId);

					plugin_loadData(engineId, rConfig, dataset, cbCtx);
				}

			} else if (action.equals("executeRules")) {

				if (args.length() != 3)
					cbCtx.error(String.format(nrArgs_errMsg, "executeRules", 3, "engineId, rConfig, ruleset"));

				else {
					String engineId = args.getString(0);
					ReasoningConfig rConfig = new ReasoningConfig(args.getJSONObject(1));
					RulesetConfigContainer ruleset = new RulesetConfigContainer(args.getJSONObject(2));

					Log.d("NativeEnginesPlugin.executeRules: " + engineId);

					plugin_executeRules(engineId, rConfig, ruleset, cbCtx);
				}

			} else if (action.equals("loadRules")) {

				if (args.length() != 3)
					cbCtx.error(String.format(nrArgs_errMsg, "loadRules", 3, "engineId, rConfig, ruleset"));

				else {
					String engineId = args.getString(0);
					ReasoningConfig rConfig = new ReasoningConfig(args.getJSONObject(1));
					RulesetConfigContainer ruleset = new RulesetConfigContainer(args.getJSONObject(2));

					Log.d("NativeEnginesPlugin.loadRules: " + engineId);

					plugin_loadRules(engineId, rConfig, ruleset, cbCtx);
				}

			} else if (action.equals("execute")) {

				if (args.length() != 2)
					cbCtx.error(String.format(nrArgs_errMsg, "execute", 2, "engineId, rConfig"));

				else {
					String engineId = args.getString(0);
					ReasoningConfig rConfig = new ReasoningConfig(args.getJSONObject(1));
					Log.d("NativeEnginesPlugin.execute: " + engineId);

					plugin_execute(engineId, rConfig, cbCtx);
				}

			} else if (action.equals("inference")) {

				if (args.length() != 3)
					cbCtx.error(String.format(nrArgs_errMsg, "inference", 3, "engineId, rConfig, ontology"));

				else {
					String engineId = args.getString(0);
					ReasoningConfig rConfig = new ReasoningConfig(args.getJSONObject(1));
					DatasetConfigContainer ontology = new DatasetConfigContainer(args.getJSONObject(2));
					Log.d("NativeEnginesPlugin.inference: " + engineId);

					plugin_inference(engineId, rConfig, ontology, cbCtx);
				}

			} else if (action.equals("entails")) {

				if (args.length() != 4)
					cbCtx.error(String.format(nrArgs_errMsg, "entails", 4, "engineId, rConfig, ontology1, ontology2"));

				else {
					String engineId = args.getString(0);
					ReasoningConfig rConfig = new ReasoningConfig(args.getJSONObject(1));
					DatasetConfigContainer service = new DatasetConfigContainer(args.getJSONObject(2));
					DatasetConfigContainer goal = new DatasetConfigContainer(args.getJSONObject(3));
					Log.d("NativeEnginesPlugin.entails: " + engineId);

					plugin_entails(engineId, rConfig, service, goal, cbCtx);
				}

			} else if (action.equals("dumpHeap")) {

				if (args.length() != 2)
					cbCtx.error(String.format(nrArgs_errMsg, "dumpHeap", 2, "engineId, fileName"));

				else {
					String engineId = args.getString(0);
					String fileName = args.getString(1);

					plugin_dumpHeap(engineId, fileName, cbCtx);
				}

			} else
				return false;

			return true;

		} catch (JSONException e) {
			e.printStackTrace();

			throw e;
		}
	}

	public void onDestroy() {
		super.onDestroy();
	}

	private void plugin_getEngineConfig(String engineId, CallbackContext cbCtx) {
		Intent intent = getIntentWithResponse(PluginActions.GET_ENGINE_CONFIG, cbCtx);
		intent.putExtra("engineId", engineId);

		cordova.getActivity().startService(intent);
	}

	private void plugin_init(String engineId, CallbackContext cbCtx) {
		Intent intent = getIntentWithResponse(PluginActions.INIT, cbCtx);
		intent.putExtra("engineId", engineId);

		cordova.getActivity().startService(intent);
	}

	private void plugin_reset(String engineId, CallbackContext cbCtx) {
		Intent intent = getIntentWithResponse(PluginActions.RESET, cbCtx);
		intent.putExtra("engineId", engineId);

		cordova.getActivity().startService(intent);
	}

	private void plugin_destroy(String engineId, CallbackContext cbCtx) {
		Intent intent = getIntentWithResponse(PluginActions.DESTROY, cbCtx);
		intent.putExtra("engineId", engineId);

		cordova.getActivity().startService(intent);
	}

	private void plugin_loadData(String engineId, ReasoningConfig rConfig, DatasetConfigContainer dataset,
			CallbackContext cbCtx) {

		Intent intent = getIntentWithResponse(PluginActions.LOAD_DATA, cbCtx);
		intent.putExtra("engineId", engineId);
		intent.putExtra("rConfig", new CParcelable(rConfig));
		intent.putExtra("dataset", new CParcelable(dataset));

		cordova.getActivity().startService(intent);
	}

	private void plugin_executeRules(String engineId, ReasoningConfig rConfig, RulesetConfigContainer ruleset,
			CallbackContext cbCtx) {

		Intent intent = getIntentWithResponse(PluginActions.EXECUTE_RULES, cbCtx);
		intent.putExtra("engineId", engineId);
		intent.putExtra("rConfig", new CParcelable(rConfig));
		intent.putExtra("ruleset", new CParcelable(ruleset));

		cordova.getActivity().startService(intent);
	}

	private void plugin_loadRules(String engineId, ReasoningConfig rConfig, RulesetConfigContainer ruleset,
			CallbackContext cbCtx) {

		Intent intent = getIntentWithResponse(PluginActions.LOAD_RULES, cbCtx);
		intent.putExtra("engineId", engineId);
		intent.putExtra("rConfig", new CParcelable(rConfig));
		intent.putExtra("ruleset", new CParcelable(ruleset));

		cordova.getActivity().startService(intent);
	}

	private void plugin_execute(String engineId, ReasoningConfig rConfig, CallbackContext cbCtx) {

		Intent intent = getIntentWithResponse(PluginActions.EXECUTE, cbCtx);
		intent.putExtra("engineId", engineId);
		intent.putExtra("rConfig", new CParcelable(rConfig));

		cordova.getActivity().startService(intent);
	}

	private void plugin_inference(String engineId, ReasoningConfig rConfig, DatasetConfigContainer ontology,
			CallbackContext cbCtx) {

		Intent intent = getIntentWithResponse(PluginActions.INFERENCE, cbCtx);
		intent.putExtra("engineId", engineId);
		intent.putExtra("rConfig", new CParcelable(rConfig));
		intent.putExtra("ontology", new CParcelable(ontology));

		cordova.getActivity().startService(intent);
	}

	private void plugin_entails(String engineId, ReasoningConfig rConfig, DatasetConfigContainer ontology1,
			DatasetConfigContainer ontology2, CallbackContext cbCtx) {

		Intent intent = getIntentWithResponse(PluginActions.ENTAILS, cbCtx);
		intent.putExtra("engineId", engineId);
		intent.putExtra("rConfig", new CParcelable(rConfig));
		intent.putExtra("service", new CParcelable(ontology1));
		intent.putExtra("goal", new CParcelable(ontology2));

		cordova.getActivity().startService(intent);
	}

	private void plugin_dumpHeap(String engineId, String fileName, CallbackContext cbCtx) {
		Intent intent = getIntentWithResponse(PluginActions.DUMP_HEAP, cbCtx);
		intent.putExtra("engineId", engineId);
		intent.putExtra("fileName", fileName);

		cordova.getActivity().startService(intent);
	}

	private Intent getIntent(String action) {
		Intent intent = new Intent(cordova.getActivity(), NativeEnginesService.class);
		intent.setAction(action);

		return intent;
	}

	private Intent getIntentWithResponse(String action, CallbackContext cbCtx) {
		Intent intent = getIntent(action);
		setResponseReceiver(intent, cbCtx);

		return intent;
	}

	private void setResponseReceiver(Intent intent, CallbackContext cbCtx) {
		curCbCtx = cbCtx;
		Log.d("set curCbCtx");

		Intent rIntent = new Intent(PluginActions.ACTION_DONE);
		intent.putExtra("returnIntent", rIntent);

		responseReceiver = new ResponseReceiver();
		cordova.getActivity().registerReceiver(responseReceiver, new IntentFilter(PluginActions.ACTION_DONE));
	}

	private class ResponseReceiver extends BroadcastReceiver {

		public void onReceive(Context context, Intent intent) {
			Log.d("Plugin.ResponseReceiver.onReceive");
			
			try {
				if (intent.hasExtra("exception")) {
					JSONObject exc = getJson(intent, "exception");

					curCbCtx.error(exc);

				} else if (intent.hasExtra("engineConfig")) {
					JSONObject engineConfig = getJson(intent, "engineConfig");

					curCbCtx.success(engineConfig);

				} else if (intent.hasExtra("times")) {
					JSONObject times = getJson(intent, "times");

					curCbCtx.success(times);

				} else if (intent.hasExtra("results")) {
					JSONObject results = getJson(intent, "results");

					curCbCtx.success(results);

				} else
					curCbCtx.success();

			} catch (JSONException e) {
				curCbCtx.error("Error getting results: " + e.getMessage());

				return;
			}

			cordova.getActivity().unregisterReceiver(this);
		}
	}
}
