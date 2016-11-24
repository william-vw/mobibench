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

var libPath = "js/engines/rdfstore_js/libs/";

engine = {
	id : 'RDFStore_JS',

	config : {
		libs : [ libPath + "rdf_interface_api_min.js",
				libPath + "rdf_store.js", libPath + "naive_reasoner.js" ],

		resources : {
			rules : {
				format : 'SPARQLUpdate',
				toArray : true
			},
			data : {
				format : 'RDFStore_JS',
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

	reset : function(callback) {
		this.reasoner = undefined;

		callback();
	},

	destroy : function(callback) {
		this.reset(callback);
	},

	doLoadData : function(rConfig, dataset, callback) {
		var resultTimes = new ResultTimes();

		var triples = dataset.content;

		if (!this.reasoner)
			this.reasoner = new RDFStore_JSReasoner();

		var timer = new Timer("loadData", resultTimes);
		timer.begin();
		// doLog("loadData.begin");

		if (triples != "") {
			for (var i = 0; i < triples.length; i++) {
				var triple = triples[i];
				// doLog("loading triple: " + triple);

				// code always returns after passed callback function is called
				this.reasoner.execute('INSERT DATA { ' + triple + ' }',
						function(result, msg) {
						});
			}
		}

		// doLog("loadData.done");
		timer.done();

		callback(resultTimes);

		// some bug in RDFStore_JS prevents this code from being executed

		// var self = this;
		// performSync(function(triple, cb) {
		//
		// self.store.execute('INSERT DATA { ' + triple + ' }', cb);
		//
		// }, this, null, triples,
		//
		// function() {
		// timer.loadData.done();
		// // doLog("loadData.done");
		//
		// callback();
		// });

		// NOTE "load" allows some flexibility but take more time
		// store.load('text/n3',triples[i],function(results, msg) {});
	},

	doExecRules : function(rConfig, ruleset, callback) {
		var self = this;

		var resultTimes = new ResultTimes();

		var rules = ruleset.content;

		var timer = new Timer("executeRules", resultTimes);
		timer.begin();
		doLog("execRules.begin");

		this.reasoner.reason(rules);

		doLog("execRules.done");
		timer.done();

		timer = new Timer("collectInferred", resultTimes);
		timer.begin();

		var inferred = [];
		this.reasoner.execute("SELECT ?x ?y ?z WHERE { ?x ?y ?z . } ",

		function(success, results) {

			for (var i = 0; i < results.length; i++)
				inferred.push(self.toString(results[i]));

			timer.done();

			callback(inferred, resultTimes);
		});
	},

	dumpHeap : function(callback) {
		throw "heap dump not supported";
	},

	toString : function(stmt) {
		var strs = [];

		for ( var id in stmt) {
			if (stmt.hasOwnProperty(id)) {

				var value = stmt[id];
				switch (value.token) {

				case 'uri':
					strs.push("<" + value.value + ">");

					break;

				case 'literal':
					strs.push("\"" + value.value + "\"");

					break;

				default:
					strs.push(value.value);

					break;
				}
			}
		}

		var str = "";
		for (var i = 0; i < strs.length; i++) {
			if (i > 0)
				str += " ";

			str += strs[i];
		}
		str += " .";

		return str;
	}

// code doesn't work, since RDFStore-JS doesn't support CONSTRUCT queries
// getInferred : function(rules, cb) {
// performSync(function(rule, cb) {
// var where = rule.substring(rule.indexOf("{") + 1,
// rule.indexOf("}"));
// var query = "CONSTRUCT WHERE {" + where + "}";
//			
// doLog("query? " + query);
// this.store.execute(query, function(success, results) {
// doLog("results: " + JSON.stringify(results));
//				
// cb();
// });
//		
// }, this, null, rules);
// }
};
