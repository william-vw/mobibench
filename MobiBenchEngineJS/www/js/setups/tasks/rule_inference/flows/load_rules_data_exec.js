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

LoadRulesDataExec = function(task, config) {

	SubFlow.call(this, task, config);

	this.loadedRules = false;

	this.inference = function(resource, callback) {
		var self = this;
		this.config = this.reasoning;

		this.engine = this.task.engine;
		
		this.ruleset = resource.rules;
		this.dataset = resource.data;

		this.id = this.dataset.id + "-" + this.ruleset.id;

		this.callback = callback;

		this.loadRules();
	};

	this.loadRules = function() {
		var self = this;

		if (!this.loadedRules)
			this.engine.loadRules(this.config, this.ruleset, function(
					loadRulesTimes) {

				self.task.updateTimes(self.id, loadRulesTimes);
				self.loadedRules = true;

				self.loadData();
			});
		else
			this.loadData();
	};

	this.loadData = function() {
		var self = this;

		this.engine.loadData(this.config, this.dataset,
				function(loadDataTimes) {
					self.task.updateTimes(self.id, loadDataTimes);

					self.exec();
				});
	};

	this.exec = function() {
		var self = this;

		if (this.doReason(this.dataset))

			self.engine.execute(this.config, function(inferred, execTimes) {
				self.task.updateTimes(self.id, execTimes);
				
				self.task.inferred(self.callback, self.dataset, 
					{ 
						id : self.ruleset.id + ">" + self.dataset.id,
						inferred : inferred
					});
			});

		else
			self.callback();
	}
}
