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
package wvw.mobile.plugins.cb;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import wvw.utils.log2.Log;
import wvw.mobibench.MobiBenchEngineJS;

public class CallbackPlugin extends CordovaPlugin {

	public static MobiBenchEngineJS activity;

	public boolean execute(String action, JSONArray args, CallbackContext cbCtx)
			throws JSONException {

		Log.d("CallbackPlugin." + action);
		if (action.equals("doneLoading")) {

			String ret = activity.doneLoading();
			cbCtx.success(ret);

		} else if (action.equals("benchmarkDone")) {
			activity.benchmarkDone();

			cbCtx.success();

		} else
			return false;

		return true;
	}
}