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

BuiltinOntologyInference = function(engine, config) {

	OntologyInference.call(this, engine, config);

	this.resourcesPrepared = false;

	this.runBenchmark = function(callback) {

		if (!this.resourcesPrepared) {
			this.resourcesPrepared = true;

			this.resources = this.prepareResources();
			this.config.resources = this.resources;
		}

		var flow = this.createProcessFlow({
			op : this.inference,

			obj : this
		});

		flow.execute(callback);
	};

	this.inference = function(ontology, callback) {
		var self = this;

		ontology = ontology.data;

		var config = this.reasoning;
		this.engine.inference(config, ontology,

			function(consistent, conflicts, inferred, resultTimes) {
				self.updateTimes(ontology.id, resultTimes);
	
				self.inferred(callback, ontology, {
					id : ontology.id, 
					inferred : inferred }, consistent, conflicts);
			});
	};

	this.prepareResources = function() {
		var ontology = this.resources.ontology;
		var datasets = [ ontology ];

		return {
			data : datasets
		};
	};
}
