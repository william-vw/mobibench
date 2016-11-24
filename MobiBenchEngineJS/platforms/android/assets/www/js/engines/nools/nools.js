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

var libPath = "js/engines/nools/libs/";

engine = {
	id : 'Nools',

	config : {
		libs : [ libPath + "nools.min.js", libPath + "builtins.js" ],

		resources : {
			rules : {
				format : 'Nools',
				toArray : false
			},
			data : {
				format : 'Nools',
				toArray : true,
			}
		},

		reasoning : {
			mechanism : {
				rule_inference : {
					type : 'builtin',

					subFlow : 'load_rules_data_exec'
				}
			}
		}
	},

	init : function(callback) {
		ReasoningEngine.call(this);

		callback();
	},

	reset : function(callback) {
		if (this.session) {
			this.session.dispose();
			nools.deleteFlows();

			this.inferred.length = 0;
		}

		callback();
	},

	destroy : function(callback) {
		this.reset(callback);
	},

	doLoadRules : function(rConfig, ruleset, callback) {
		doLog("loadRules");

		var resultTimes = new ResultTimes();

		var rules = ruleset.content;

		var timer = new Timer("loadRules", resultTimes);
		timer.begin();

		// doLog("rules: " + rules);

		// > Without pre-compilation support

		// compile DSL rules
		var flow = nools.compile(rules, {
			name : 'all'
		});

		RDFStatement = flow.getDefined('RDFStatement'), RDFResource = flow
				.getDefined('RDFResource'), RDFBlankNode = flow
				.getDefined('RDFBlankNode'), RDFLiteral = flow
				.getDefined('RDFLiteral'), RDFProperty = flow
				.getDefined('RDFProperty');

		this.session = flow.getSession();

		// > With pre-compilation support

		// // NOTE to precompile the nools rules: see processRules.js
		//
		// // NOTE tried separating the retrieval and evaluation; as expected,
		// // eval took up 99.9% of the time
		//		
		// // retrieve compiled rete network
		// $.ajax({
		// url: "js/engines/nools/res/compiled.js",
		// async: false,
		// dataType: "script",
		// });
		//
		// var flow = nools.getFlow("all");
		//
		// RDFStatement = flow.getDefined('RDFStatement'),
		// RDFResource = flow.getDefined('RDFResource'),
		// RDFLiteral = flow.getDefined('RDFLiteral'),
		// RDFProperty = flow.getDefined('RDFProperty'),
		// session = flow.getSession();

		timer.done();

		callback(resultTimes);
	},

	doLoadData : function(rConfig, dataset, callback) {
		doLog("loadData");

		var resultTimes = new ResultTimes();

		var triples = dataset.content;

		var timer = new Timer("loadData", resultTimes);
		timer.begin();

		for (var i = 0; i < triples.length; i++) {
			var triple = triples[i];
			// doLog("triple: " + triple);

			triple = evalNReturn(triple);
			this.session.assert(triple);
		}

		timer.done();

		callback(resultTimes);
	},

	doExecute : function(rConfig, callback) {
		doLog("execute");

		var resultTimes = new ResultTimes();

		var self = this;

		var timer = new Timer("execute", resultTimes);
		timer.begin();

		// - setup listener for newly inferred facts
		this.inferred = [];
		this.session.on("assert", function(fact) {
			var stmt = fact.toString();

			if (self.inferred.indexOf(stmt) == -1)
				self.inferred.push(stmt);
		});

		this.session.match(function(err) {
			doLog("match returned..");

			for (var i = 0; i < builtin_resolveFns.length; i++)
				builtin_resolveFns[i]();

			timer.done();

			if (err)
				doLog("\nError during reasoning: " + err);
			else
				doLog("\nReasoning finished succesfully.");

			callback(self.inferred, resultTimes);
		});
	},

	dumpHeap : function(callback) {
		throw "heap dump not supported";
	}
};
