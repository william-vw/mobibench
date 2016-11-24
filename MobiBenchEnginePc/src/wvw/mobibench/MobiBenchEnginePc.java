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

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.nio.file.Paths;
import java.util.Enumeration;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.json.JSONObject;

import wvw.mobibench.call.plugins.cb.CallbackListener;
import wvw.mobibench.call.plugins.cb.CallbackPlugin;
import wvw.mobibench.exception.BenchmarkException;
import wvw.mobibench.wrap.Env;
import wvw.mobile.utils.PcUtils;
import wvw.mobile.utils.Utils;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;

public class MobiBenchEnginePc implements CallbackListener {

	// NOTE update based on your machine
	public static String rootPath = "C:/Users/William/git/mobile-benchmarks/";

	public static String utilsPath = rootPath
			+ "MobiBenchEnginePc/src/wvw/mobile/utils/";
	public static String wwwPath = rootPath + "MobiBenchEngineJS/www/";
	public static String jarPath = rootPath + "MobiBenchEnginePc/libs/";

	private BenchmarkEngineListener listener;
	private ScriptEngine scriptEngine;

	private String config;

	private void init() {
		Log.setTarget(new SystemOutTarget());
		Env.setFilesDir(new File(Paths.get("").toAbsolutePath().toFile(), "data/"));
		
		Utils.setInstance(new PcUtils(utilsPath));
	}

	public MobiBenchEnginePc() throws BenchmarkException {
		init();

		CallbackPlugin.setListener(this);
		setupJsEnv();
	}

	public MobiBenchEnginePc(BenchmarkEngineListener listener)
			throws BenchmarkException {
		init();

		this.listener = listener;
		CallbackPlugin.setListener(this);
	}

	private void setupJsEnv() throws BenchmarkException {
		scriptEngine = new ScriptEngineManager().getEngineByName("nashorn");
		try {
			scriptEngine.eval("window = {};");
			scriptEngine.eval("wwwPath = \"" + wwwPath + "\"");
			// (init.js calls CallbackPlugin.doneLoading when done loading,
			// which will call doneLoading() on this object)
			scriptEngine
					.eval(new FileReader(wwwPath + "js/platforms/pc/init.js"));

		} catch (ScriptException | FileNotFoundException e) {
			throw new BenchmarkException(e);
		}
	}

	private boolean isJsEnvSetup() {
		return scriptEngine != null;
	}

	public void execBenchmark(String config) throws BenchmarkException {
		JSONObject obj = new JSONObject(config);

		InetAddress ip = getIp();
		if (ip != null)
			obj.put("config", createConfig(ip.getHostAddress()));

		config = obj.toString();
		this.config = config;

		if (!isJsEnvSetup())
			setupJsEnv();
		else
			try {
				scriptEngine.eval(jsFn_execBenchmark(config));

			} catch (ScriptException e) {
				throw new BenchmarkException(e);
			}
	}

	private InetAddress getIp() {
		try {
			Enumeration<NetworkInterface> intfs = NetworkInterface
					.getNetworkInterfaces();

			while (intfs.hasMoreElements()) {
				NetworkInterface intf = intfs.nextElement();

				if (intf.isUp() && !intf.isLoopback())
					return intf.getInetAddresses().nextElement();
			}

		} catch (SocketException e) {
			e.printStackTrace();
		}

		return null;
	}

	private JSONObject createConfig(String retIp) {
		JSONObject config = new JSONObject();

		JSONObject webService = new JSONObject();
		webService.put("url", "http://" + retIp + ":8080/MobiBenchWebService/");

		config.put("webService", webService);

		return config;
	}

	public String jsFn_execBenchmark(String config) {
		// @formatter:off
		return 
			"execBenchmark(" + config + ", " + 
				"function() {" + 
					"doLog(\"runner: benchmark done\");" +
		
					"callbackPlugin.benchmarkDone(function() {});" + 
			"});";
		// @formatter:on	
	}

	public String doneLoading() {
		return jsFn_execBenchmark(config);
	}

	public void benchmarkDone() {
		if (listener != null)
			listener.benchmarkDone();
	}

	public String getConfig() {
		return config;
	}

	public void done() {
		// currently, there doesn't seem to be a way to stop evaluation
		// http://stackoverflow.com/questions/1601246/java-scripting-api-how-to-stop-the-evaluation
		// Thread.currentThread().stop();
	}
}
