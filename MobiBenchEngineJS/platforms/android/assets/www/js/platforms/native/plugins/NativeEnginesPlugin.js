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

	errorMsg : "Error calling nativeEngines.{0} (NativeEnginesPlugin): {1}",

	getEngineConfig : function(engineId, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "getEngineConfig", error ]));

		}, "NativeEnginesPlugin", "getEngineConfig", [ engineId ]);
	},

	init : function(engineId, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "init", error ]));

		}, "NativeEnginesPlugin", "init", [ engineId ]);
	},

	reset : function(engineId, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "reset", error ]));

		}, "NativeEnginesPlugin", "reset", [ engineId ]);
	},

	destroy : function(engineId, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "destroy", error ]));

		}, "NativeEnginesPlugin", "destroy", [ engineId ]);
	},

	loadData : function(engineId, rConfig, dataset, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "loadData", error ]));

		}, "NativeEnginesPlugin", "loadData", [ engineId, rConfig, dataset ]);
	},

	executeRules : function(engineId, rConfig, ruleset, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "executeRules", error ]));

		}, "NativeEnginesPlugin", "executeRules",
				[ engineId, rConfig, ruleset ]);
	},

	loadRules : function(engineId, rConfig, ruleset, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "loadRules", error ]));

		}, "NativeEnginesPlugin", "loadRules", [ engineId, rConfig, ruleset ]);
	},

	execute : function(engineId, rConfig, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "execute", error ]));

		}, "NativeEnginesPlugin", "execute", [ engineId, rConfig ]);
	},

	inference : function(engineId, rConfig, ontology, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "inference", error ]));

		}, "NativeEnginesPlugin", "inference", [ engineId, rConfig, ontology ]);
	},

	entails : function(engineId, rConfig, service, goal, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "entails", error ]));

		}, "NativeEnginesPlugin", "entails",
				[ engineId, rConfig, service, goal ]);
	},

	dumpHeap : function(engineId, fileName, callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			window.onerror(self.formatError([ "dumpHeap", error ]));

		}, "NativeEnginesPlugin", "dumpHeap", [ engineId, fileName ]);
	},

	formatError : function(args) {
		return formatError(args, this.errorMsg);
	}
};
