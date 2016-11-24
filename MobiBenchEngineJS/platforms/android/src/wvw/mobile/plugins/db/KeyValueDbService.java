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

import android.content.Intent;
import android.os.IBinder;
import wvw.mobibench.App;
import wvw.mobibench.PluginActions;
import wvw.mobibench.bg_task.BgTask;
import wvw.mobibench.exception.BenchmarkException;
import wvw.mobile.plugins.MobiBenchPluginService;
import wvw.utils.log2.Log;

public class KeyValueDbService extends MobiBenchPluginService {

	private Intent curIntent;

	private KeyValueDb db = new KeyValueDb(this);

	public void onCreate() {
		init();
	}

	public int onStartCommand(Intent intent, int flags, int startId) {
		App.context = this;
		curIntent = intent;

		String action = intent.getAction();
		Log.d("KeyValueDbService.onStartCommand: " + action);

		try {
			if (action.equals(PluginActions.STORE)) {
				new BgTask() {
					protected void task() throws Exception {
						String key = curIntent.getStringExtra("key");
						String value = curIntent.getStringExtra("value");

						db.store(key, value);
						sendBack(curIntent);
					}
				}.runTask();

			} else if (action.equals(PluginActions.RETRIEVE)) {
				new BgTask() {
					protected void task() throws Exception {
						String key = curIntent.getStringExtra("key");

						Value value = new Value(db.retrieve(key));
						sendBack(curIntent, "value", value);
					}
				}.runTask();
			}

		} catch (Exception e) {
			onBgException(e);
		}

		return START_NOT_STICKY;
	}

	public IBinder onBind(Intent intent) {
		return null;
	}

	public void onDestroy() {
		Log.d("KeyValueDbService.onDestroy");
	}

	public void onBgException(BenchmarkException e) {
		e.printStackTrace();

		sendBack(curIntent, e);
	}

	public void onBgException(Exception e) {
		e.printStackTrace();

		sendBack(curIntent, new BenchmarkException(e));
	}
}
