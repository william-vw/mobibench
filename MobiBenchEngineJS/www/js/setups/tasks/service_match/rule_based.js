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

RuleBasedServiceMatch = function(engine, config) {

	config.inferredFilter = "<http://127.0.0.1/matches> \"true\"";
	ServiceMatch.call(this, engine, config);

	this.ruleInf = new BuiltinRuleInference(engine, config);

	this.runBenchmark = function(callback) {
		var self = this;
		var config = this.reasoning;

		var resources = this.resources;
		
		var owl2rl = resources.owl2rl;
		var sources = resources.sources;
		var targets = resources.targets;
		
		doLog("# rules: " + sources.rules.content.length);
		doLog("# axiom sets: " + targets.content.length);

		applyOnEach(
			[ sources.rules.content, sources.axioms.content ],
			[ targets.content ],
			{
				target : this,

				fn : function(source, target, cb, idx1, idx2) {
					log.msg("src" + idx1 + " on target " + idx2);
					
					var rule = source[0];
					var ruleAxioms = source[1];
					var axioms = target[0];
					
					// else, get StackOverflowError on Nashorn (JDK 8)
					setTimeout(function() {
						r = self.prepareResources(rule, ruleAxioms, axioms);
						// doLog("preparedRes: " + JSON.stringify(r, null, 4));
						
						self.ruleInf.runBenchmark(function() {
							self.engine.reset(cb);

						}, r);
						
					}, 1);
				}

			}, function() {
				this.times = this.ruleInf.times;
				this.times.options = this.timeOptions;

				inferredFilter = undefined;

				callback();
			});
	};

	this.prepareResources = function(rule, ruleAxioms, axioms) {
		var resources = this.resources;
		var owl2rl = resources.owl2rl;

		var datasets = null, rulesets = null;
		if (owl2rl) {
			var datasets = [ mergeResources(axioms, ruleAxioms, owl2rl.axioms) ];
			var rulesets = [ mergeResources(rule, owl2rl.rules) ];

		} else {
			datasets = [ mergeResources(axioms, ruleAxioms) ];
			rulesets = [ rule ];
		}

		return {
			data : datasets,

			rules : rulesets
		};
	}
}
