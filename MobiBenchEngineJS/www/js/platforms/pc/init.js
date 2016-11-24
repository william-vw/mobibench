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

// General configuration
load(wwwPath + 'js/config.js');

// jQuery
// load(wwwPath + 'js/libs/jquery-1.11.2.min.js');

// Libraries

// (pc)
load(wwwPath + 'js/platforms/pc/libs/log.js');
load(wwwPath + 'js/platforms/pc/libs/load.js');
load(wwwPath + 'js/platforms/pc/libs/utils.js');

load(wwwPath + 'js/libs/webservice_utils.js');
load(wwwPath + 'js/libs/storage.js');
load(wwwPath + 'js/libs/logging.js');
load(wwwPath + 'js/libs/ResultTimes.js');
load(wwwPath + 'js/libs/BenchmarkTimes.js');
load(wwwPath + 'js/libs/ComposedIterableObject.js');
load(wwwPath + 'js/libs/ComposedIterableArray.js');
load(wwwPath + 'js/libs/IterableArray.js');
load(wwwPath + 'js/libs/IterableMap.js');
load(wwwPath + 'js/libs/Timer.js');
load(wwwPath + 'js/libs/Enum.js');
load(wwwPath + 'js/libs/moment.js');
load(wwwPath + 'js/libs/utils.js');
load(wwwPath + 'js/libs/owl2rl-utils.js');
load(wwwPath + 'js/libs/ReasoningEngine.js');
load(wwwPath + 'js/libs/Proxy.js');
load(wwwPath + 'js/libs/conformance.js');

// Loaders
load(wwwPath + 'js/engines/loader.js');
load(wwwPath + 'js/setups/loader.js');
load(wwwPath + 'js/setups/tasks/loader.js');
load(wwwPath + 'js/setups/flows/loader.js');

// Benchmark
load(wwwPath + 'js/benchmark.js');

// Plugins
load(wwwPath + 'js/platforms/pc/plugins/HttpRequestPlugin.js');
load(wwwPath + 'js/platforms/pc/plugins/NativeEnginesPlugin.js');
load(wwwPath + 'js/platforms/pc/plugins/CallbackPlugin.js');
load(wwwPath + 'js/platforms/pc/plugins/KeyValueDbPlugin.js');

doLog("loading engines");
loadEngines(function() {

	doLog("loading tasks");
	loadTasks(function() {

		doLog("loading flows");
		loadFlows(function() {

			callbackPlugin.doneLoading(function(fn) {
				fn();
			});
		});
	});
});
