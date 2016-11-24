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

var libPath = "js/engines/rdfquery/libs/";

engine = {
	id : 'RDFQuery',

	config : {
		libs : [ libPath + "jquery.rdfquery.rules-1.0.js" ],

		resources : {
			rules : {
				format : 'RDFQuery',
				toArray : true
			},
			data : {
				format : 'RDFQuery',
				toArray : true
			}
		},

		reasoning : {

			mechanism : {
				rule_inference : {
					type : 'builtin',

					subFlow : 'load_data_exec_rules'
				}
			}
		}
	},

	init : function(callback) {
		ReasoningEngine.call(this);
		
		callback();
	},

	// called in case of new run
	reset : function(callback) {
		this.store = undefined;

		callback();
	},

	destroy : function(callback) {
		this.reset(callback);
	},

	doLoadData : function(rConfig, dataset, callback) {
		var resultTimes = new ResultTimes();

		var triples = dataset.content;

		if (!this.store)
			this.store = $.rdf();

		var timer = new Timer("loadData", resultTimes);
		timer.begin();

		for (var i = 0; i < triples.length; i++) {
			var triple = triples[i];
			if (!triple)
				continue;

			this.store = this.store.add(triple);
		}

		timer.done();

		callback(resultTimes);
	},

	doExecRules : function(rConfig, ruleset, callback) {
		var resultTimes = new ResultTimes();

		var timer = new Timer("createRules", resultTimes);

		var rules = ruleset.content;

		var parsedRules = [];
		for (var i = 0; i < rules.length; i++) {
			var rule = evalNReturn(rules[i]);

			timer.begin();
			parsedRules.push($.rdf.rule(rule.left, rule.right));
			timer.done();
		}

		timer.begin();
		var ruleset = $.rdf.ruleset(parsedRules);
		timer.done();

		timer = new Timer("executeRules", resultTimes);

		timer.begin();
		this.store = this.store.reason(ruleset);
		timer.done();

		timer = new Timer("collectInferred", resultTimes);
		timer.begin();

		var inferred = [];
		this.store.where("?x ?y ?z").each(function() {
			inferred.push(this.x + " " + this.y + " " + this.z + " .\n");
		});

		timer.done();

		callback(inferred, resultTimes);
	},

	dumpHeap : function(callback) {
		throw "heap dump not supported";
	}
};
