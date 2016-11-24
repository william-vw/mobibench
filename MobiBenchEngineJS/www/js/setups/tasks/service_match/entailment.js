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

EntailmentServiceMatch = function(engine, config) {

	ServiceMatch.call(this, engine, config);

	this.runBenchmark = function(callback) {
		var self = this;
		var config = this.reasoning;

		var resources = this.resources;

		performSync(function(sources, target, cb) {

			performSync(function(target, source, cb2) {
				self.engine.entails(config, source, target, function(entails,
						times) {

					self.updateTimes('entails', times);
					
					var id = (source.id + " - " + target.id);
					self.inferred(cb2, target, {
						id : id,
						inferred: (entails ? [ "matches? " + entails ] : [])
					});
				});

			}, this, [ target ], sources, function() {

				cb();
			});

		}, this, [ resources.sources.content ], resources.targets.content, callback);
	}
}
