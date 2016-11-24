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

LoadDataExecRules = function(task, config) {

	SubFlow.call(this, task, config);

	this.inference = function(resource, callback) {		
		var self = this, config = this.reasoning, task = this.task, engine = task.engine;
		
		var ruleset = resource.rules;
		var dataset = resource.data;
		
		var id = dataset.id + "-" + ruleset.id;
		
		engine.loadData(config, dataset, function(loadTimes) {
			task.updateTimes(id, loadTimes);

			if (self.doReason(dataset))

				engine.execRules(config, ruleset, function(
						inferred, execTimes) {

					task.updateTimes(id, execTimes);
					task.inferred(callback, dataset, 
						{ 
							id: ruleset.id + ">" + dataset.id,
							inferred: inferred 
						});
				});

			else
				callback();
		});
	}
}
