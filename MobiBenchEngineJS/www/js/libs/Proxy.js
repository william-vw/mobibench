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

function Proxy(engine) {

	ReasoningEngine.call(this);

	this.id = engine.id;
	this.config = engine.config;

	this.initConfig = function(callback) {
		var self = this;

		// add the engine configuration to the plugin's config object
		nativeEngines.getEngineConfig(this.id, function(engineConfig) {
			for ( var id in engineConfig)
				if (engineConfig.hasOwnProperty(id))

					self.config[id] = engineConfig[id];

			callback();
		});
	},

	this.init = function(callback) {
		var self = this;

		// first, initialize the engine configuration
		this.initConfig(function() {
			// then, initialize the native engine
			nativeEngines.init(self.id, callback);
		});
	};

	this.dumpHeap = function(fileName, callback) {
		nativeEngines.dumpHeap(this.id, fileName, callback);
	};

	this.reset = function(callback) {
		nativeEngines.reset(this.id, callback);
	};

	this.destroy = function(callback) {
		nativeEngines.destroy(this.id, callback);
	};

	this.doLoadData = function(bConfig, dataset, callback) {
		var self = this;

		nativeEngines.loadData(this.id, bConfig, dataset, function(opTimes) {

			callback(self.toResultTimes(opTimes));
		});
	};

	this.doExecRules = function(bConfig, ruleset, callback) {
		var self = this;

		nativeEngines.executeRules(this.id, bConfig, ruleset, function(
				execResults) {

			var inferred = execResults.inferred;

			var opTimes = execResults.resultTimes;
			var resultTimes = self.toResultTimes(opTimes);

			callback(inferred, resultTimes);
		});
	};

	this.doLoadRules = function(bConfig, ruleset, callback) {
		var self = this;

		nativeEngines.loadRules(this.id, bConfig, ruleset, function(opTimes) {

			callback(self.toResultTimes(opTimes));
		});
	};

	this.doExecute = function(bConfig, callback) {
		var self = this;

		nativeEngines.execute(this.id, bConfig, function(execResults) {
			var inferred = execResults.inferred;

			var opTimes = execResults.resultTimes;
			var resultTimes = self.toResultTimes(opTimes);

			callback(inferred, resultTimes);
		});
	};

	this.doInference = function(bConfig, ontology, callback) {
		var self = this;

		nativeEngines.inference(this.id, bConfig, ontology,

		function(infResults) {
			var consistent = infResults.consistent;
			var conflicts = infResults.conflicts;

			var inferred = infResults.inferred;

			var opTimes = infResults.resultTimes;
			var resultTimes = self.toResultTimes(opTimes);

			callback(consistent, conflicts, inferred, resultTimes);
		});
	};

	this.toResultTimes = function(opTimes) {
		var resultTimes = new ResultTimes();

		for ( var id in opTimes)
			if (opTimes.hasOwnProperty(id)) {

				resultTimes.add(id, opTimes[id].time);
			}

		return resultTimes;
	};
};
