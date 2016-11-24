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

package wvw.mobibench;

import org.apache.cordova.Config;
import org.apache.cordova.CordovaActivity;

import android.content.Intent;
import android.os.Bundle;
import wvw.mobile.plugins.cb.CallbackPlugin;
import wvw.mobile.utils.Utils;
import wvw.utils.android.AndroidUtils;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;

public class MobiBenchEngineJS extends CordovaActivity
{
	private String config = null;

	public void init() {
		Log.setTarget(new SystemOutTarget());
		
		Utils.setInstance(new AndroidUtils());
	}
	
	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		super.init();
		// Set by <content src="index.html" /> in config.xml
		super.loadUrl(Config.getStartUrl());
		// super.loadUrl("file:///android_asset/www/index.html")
		
		init();
	}

	public void onStart() {
		super.onStart();

		CallbackPlugin.activity = this;

		Intent intent = getIntent();
		if (intent.hasExtra("config")) {

			this.config = intent.getStringExtra("config");
			// Log.d("config: " + config);
		}
	}

	public String doneLoading() {
		Log.d("MobiBenchEngineJS.doneLoading()");

		if (config != null)
			return "execBenchmark(" + config + ", function() {" +
					"console.log(\"benchmark done\");" +

					"callbackPlugin.benchmarkDone(function() {});" +
					"});";
		else
			return "";
	}

	public void benchmarkDone() {
		Log.d("MobiBenchEngineJS.benchmarkDone()");

		if (config != null)
			finish();
	}

	public void onDestroy() {
		super.onDestroy();

		Log.d("MobiBenchEngineJS.onDestroy()");
	}
}
