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
package wvw.mobile.plugins.db;

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
import wvw.mobile.plugins.MobiBenchPlugin;
import wvw.utils.log2.Log;

public class KeyValueDbPlugin extends MobiBenchPlugin {

	private CallbackContext curCbCtx;
	private ResponseReceiver responseReceiver = null;

	private String nrArgs_errMsg = "Method '%s' expects %d argument(s): %s";

	public boolean execute(String action, JSONArray args, CallbackContext cbCtx)
			throws JSONException {

		App.context = this.cordova.getActivity();

		try {
			if (action.equals("store")) {

				if (args.length() != 2)
					cbCtx.error(String.format(nrArgs_errMsg, "store", 2,
							"key, value"));

				else {
					String key = args.getString(0);
					String value = args.getString(1);

					plugin_store(key, value, cbCtx);
				}

			} else if (action.equals("retrieve")) {

				if (args.length() != 1)
					cbCtx.error(String.format(nrArgs_errMsg, "retrieve", 1,
							"key"));

				else {
					String key = args.getString(0);

					plugin_retrieve(key, cbCtx);
				}
			}

			else
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

	private void plugin_store(String key, String value, CallbackContext cbCtx) {
		Intent intent = getIntentWithResponse(PluginActions.STORE, cbCtx);
		intent.putExtra("key", key);
		intent.putExtra("value", value);

		cordova.getActivity().startService(intent);
	}

	private void plugin_retrieve(String key, CallbackContext cbCtx) {
		Intent intent = getIntentWithResponse(PluginActions.RETRIEVE, cbCtx);
		intent.putExtra("key", key);

		cordova.getActivity().startService(intent);
	}

	private Intent getIntent(String action) {
		Intent intent = new Intent(cordova.getActivity(),
				KeyValueDbService.class);

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
		cordova.getActivity().registerReceiver(responseReceiver,
				new IntentFilter(PluginActions.ACTION_DONE));
	}

	private class ResponseReceiver extends BroadcastReceiver {

		public void onReceive(Context context, Intent intent) {
			Log.d("ResponseReceiver.onReceive");

			try {
				if (intent.hasExtra("value")) {
					JSONObject value = getJson(intent, "value");

					curCbCtx.success(value);

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
