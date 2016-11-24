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

function RDFStore_JSReasoner() {

	this.store = new rdfstore.Store();

	this.execute = function(query, callback) {
		this.store.execute(query, callback);
	};

	this.reason = function(rules) {		
		var self = this;

		// window.inferring = true;
		// window.inferred = [];

		var diff = 0;
		do {
			var prevNr = this.nrTriples();

			for (var i = 0; i < rules.length; i++) {
				var rule = rules[i];

				rule = rule.replace(/\n/g, " ");
				
				this.store.execute(rule, function(success, results) {
					// doLog("# triples (after rule): " +
					// self.nrTriples());
				});
			}

			var curNr = this.nrTriples();
			log.msg("# triples: " + prevNr + " - " + curNr);

			diff = (curNr - prevNr);

		} while (diff > 0);		

		// var ret = window.inferred;
		//
		// window.inferring = false;
		// window.inferred = [];
		//		
		// return ret;

		// some bug in RDFStore_JS prevents this code from being executed

		// var self = this;
		// performSync(function(rule, cb) {
		// rule = rule.replace(/\n/g, "");
		//
		// // doLog("rule: " + JSON.stringify(rule));
		// self.store.execute(rule, cb);
		//			
		// }, this, null, rules, function() {
		// timer.executeRules.done();
		// // doLog("execRules.done");
		//
		// self.getInferred(callback);
		// },
		//
		// function(success, results) {
		// });
	};

	// count # triples in store
	this.nrTriples = function() {
		var nrTriples = 0;
		this.store.graph(function(success, graph) {
			if (success)
				nrTriples = graph.length;
		});

		return nrTriples;
	};

	this.curGraph = function() {
		var curGraph = null;
		this.store.graph(function(success, graph) {
			if (success)
				curGraph = graph;
		});

		return curGraph;
	};
};
