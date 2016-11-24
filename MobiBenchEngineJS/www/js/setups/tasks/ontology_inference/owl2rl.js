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

Owl2RlOntologyInference = function(engine, config) {

	OntologyInference.call(this, engine, config);

	this.ruleInf = new BuiltinRuleInference(engine, config);

	this.runBenchmark = function(callback) {
		var self = this;

		this.ruleInf.runBenchmark(function() {
			self.times = self.ruleInf.times;

			callback();

		}, this.prepareResources());
	};

	this.prepareResources = function() {
		var ontology = this.resources.ontology;
		var owl2rl = this.resources.owl2rl;

		owl2rl.axioms.doReason = false;
		ontology.doReason = true;

		var datasets = [ owl2rl.axioms, ontology ];
		var rulesets = [ owl2rl.rules ];

		return {
			rules : rulesets,
			
			data : datasets
		};
	};
}
