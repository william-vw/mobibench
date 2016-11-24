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

nativeEngines = {

	pc : Java.type('wvw.mobibench.call.plugins.NativeEnginesPlugin'),
	errorMsg : "Error calling nativeEngines.{0} (NativeEnginesPlugin): {1}",

	getEngineConfig : function(engineId, callback) {
		var ret = this.pc.getEngineConfig(engineId);
		ret = JSON.parse(ret);

		callback(ret);
	},

	init : function(engineId, callback) {
		this.pc.init(engineId);

		callback();
	},

	reset : function(engineId, callback) {
		this.pc.reset(engineId);

		callback();
	},

	destroy : function(engineId, callback) {
		this.pc.destroy(engineId);

		callback();
	},

	loadData : function(engineId, rConfig, dataset, callback) {
		var ret = this.pc.loadData(engineId, JSON.stringify(rConfig), JSON
				.stringify(dataset));

		ret = JSON.parse(ret);

		callback(ret);
	},

	executeRules : function(engineId, rConfig, ruleset, callback) {
		var ret = this.pc.executeRules(engineId, JSON.stringify(rConfig), JSON
				.stringify(ruleset));

		ret = JSON.parse(ret);

		callback(ret);
	},

	loadRules : function(engineId, rConfig, ruleset, callback) {
		var ret = this.pc.loadRules(engineId, JSON.stringify(rConfig), JSON
				.stringify(ruleset));

		ret = JSON.parse(ret);

		callback(ret);
	},

	execute : function(engineId, rConfig, callback) {
		var ret = this.pc.execute(engineId, JSON.stringify(rConfig));
		ret = JSON.parse(ret);

		callback(ret);
	},

	inference : function(engineId, rConfig, ontology, callback) {
		var ret = this.pc.inference(engineId, JSON.stringify(rConfig), JSON
				.stringify(ontology));

		ret = JSON.parse(ret);

		callback(ret);
	},

	entails : function(engineId, rConfig, service, goal, callback) {
		var ret = this.pc.entails(engineId, JSON.stringify(rConfig), JSON
				.stringify(service), JSON.stringify(goal));
		
		ret = JSON.parse(ret);

		callback(ret);
	},

	dumpHeap : function(engineId, fileName, callback) {
		this.pc.entails(engineId, fileName);

		callback();
	},

	formatError : function(args) {
		return formatError(args, this.errorMsg);
	}
};
