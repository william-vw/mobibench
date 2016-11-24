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

package wvw.mobibench.auto;

import java.io.IOException;

import wvw.mobibench.devclient.server.DevClientHttpServer;
import wvw.mobibench.devserv.server.handler.HandlerException;
import wvw.mobibench.devserv.server.handler.HandlerListener;
import wvw.mobibench.devserv.server.handler.RequestHandler;
import wvw.utils.NetUtils;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;

public class AutoBenchmarkDeviceClient extends AutoBenchmark
		implements RequestHandler {

	private DevClientHttpServer server;

	// IMPORTANT update this IP address to the one displayed on the android app
	private String deviceAddress = "http://192.168.2.14:8082";

	public static void init() {
		Log.setTarget(new SystemOutTarget());
	}

	public static void main(String[] args) {
		init();

		AutoBenchmarkDeviceClient client = new AutoBenchmarkDeviceClient();
		client.run();
	}

	public AutoBenchmarkDeviceClient() {
		super(5000);

		server = new DevClientHttpServer(this, 8082);
		server.start();
	}

	protected void doBenchmark(String config) {
		try {
			NetUtils.sendPost(deviceAddress + "/run", config);

		} catch (IOException e) {
			Log.e("error contacting device", e);
		}
	}

	public void handle(String uri, HandlerListener listener)
			throws HandlerException {

		handle(uri, null, listener);
	}

	public void handle(String uri, String data, HandlerListener listener)
			throws HandlerException {

		benchmarkNext();
	}

	protected void allDone() {
		server.stop();
	}
}
