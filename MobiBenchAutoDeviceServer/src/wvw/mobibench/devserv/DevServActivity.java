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

package wvw.mobibench.devserv;

import java.io.IOException;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;

import android.app.Activity;
import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.text.format.Formatter;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
import wvw.mobibench.device_server.R;
import wvw.mobibench.devserv.server.handler.HandlerException;
import wvw.mobibench.devserv.server.handler.HandlerListener;
import wvw.mobibench.devserv.server.handler.RequestHandler;
import wvw.mobibench.devserv.server.http.HttpServer;
import wvw.mobibench.devserv.server.msg.OkMsg;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;

public class DevServActivity extends Activity implements RequestHandler {

	private HttpServer server;
	private JsonParser parser = new JsonParser();

	private void init() {
		Log.setTarget(new SystemOutTarget());
	}

	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_dev_serv);

		init();
		startServer();
	}

	protected void onStart() {
		super.onStart();

		TextView ownIpView = (TextView) findViewById(R.id.ownIp);
		ownIpView.setText("IP address: " + getIp() + ":8082");
	}

	@SuppressWarnings("deprecation")
	private String getIp() {
		WifiManager wm = (WifiManager) getSystemService(WIFI_SERVICE);

		return Formatter.formatIpAddress(wm.getConnectionInfo().getIpAddress());
	}

	public boolean onCreateOptionsMenu(Menu menu) {
		return super.onCreateOptionsMenu(menu);
	}

	public boolean onOptionsItemSelected(MenuItem item) {
		return super.onOptionsItemSelected(item);
	}

	private void startServer() {
		Log.d("starting server..");

		server = new HttpServer(this, 8082);
		try {
			server.start();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String retUri;
	private HandlerListener listener;

	public void handle(String uri, HandlerListener listener, String retIp)
			throws HandlerException {

		handle(uri, null, listener, retIp);
	}

	public void handle(String uri, String data, HandlerListener listener,
			String retIp) throws HandlerException {
		
		if (uri.endsWith("/run")) {
			this.retUri = "http://" + retIp
					+ ":8082/MobiBenchAutoDeviceClient/";
			this.listener = listener;

			JsonObject json = (JsonObject) parser.parse(data);
			json.add("config", createConfig(retIp));

			String config = json.toString();

			Intent intent = new Intent(BenchmarkActions.RUN);
			intent.putExtra("config", config);

			Log.d("devDevServActivity.run");
			startActivityForResult(intent, 0);

		} else
			throw new HandlerException("no supported commands in uri");
	}

	private JsonObject createConfig(String retIp) {
		JsonObject config = new JsonObject();

		JsonObject webService = new JsonObject();
		webService.add("url", new JsonPrimitive(
				"http://" + retIp + ":8080/web-service/"));

		config.add("webService", webService);

		return config;
	}

	protected void onActivityResult(int requestCode, int resultCode,
			Intent data) {
		Log.d("DevServActivity.onActivityResult");

		listener.response(retUri, new OkMsg());
	}
}
