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

// NOTE uncomment parts to perform rule / data conversion or generate
// conformance data

// - Rule conversion

// // first, retrieve rules from file
// var rules = retrieveResource("res/owl/owl2rl/tests/rules2.spin");
// // doLog("input rules:\n" + rules + "\n\n");
//
// // then, convert rules via web service
// convert(rules, 'rules', {
// to : 'Jena' // convert to this format
//
// }, function(convRules) {
// doLog("converted rules:\n" + convRules); // outputs converted rules
//
// // document.body.innerHTML = convRules.split("\n").join("<br />");
// });

// // - Data conversion

// // first, retrieve data from file
// var data = retrieveResource("res/owl/data/ore-small/0.nt");
//
// // then, convert data via web service
// convert(data, 'data', {
// syntax : 'N-TRIPLE', // (RDF syntax of incoming data)
//
// to : 'Datalog' // convert to this format
//
// }, function(convData) {
// // doLog("converted data:\n" + convData);
//
// document.body.innerHTML = convData.split("\n").join("<br />");
// });

// - Ruleset selection

// -- default selection

// // first, retrieve required data
// var rules = retrieveResource("res/owl/owl2rl/full/rules.spin");
// var axioms = retrieveResource("res/owl/owl2rl/full/axioms.nt");
//
// // choose some selections
// var selections = [ loadSelectConfig('consist') ];
//
// // then, obtain rule subset from web service
// defaultSelect(rules, axioms, selections, function(ret) {
// var rules = ret.rules;
//
// doLog("# rules: " + rules.split("\n\n#").length);
// doLog(rules);
//
// document.body.innerHTML += "(see javascript console)";
// });

// -- domain-based selection

// // first, retrieve required data
// var rules = retrieveResource("res/owl/owl2rl/full/rules.spin");
// var axioms = retrieveResource("res/owl/owl2rl/full/axioms.nt");
//
// var ontology = retrieveResource("res/services/all.nt");
//
// // then, obtain rule subset from web service
// domainBasedSelect(rules, axioms, ontology, "N-TRIPLE", "forward_naive",
//
// function(rules) {
// doLog("# rules: " + rules.split("\n\n#").length);
// doLog(rules);
//
// document.body.innerHTML += "(see javascript console)";
// });

// - Pre-processing

// first, retrieve required data
var path = "res/owl/data/conf/full.nt";
var ontology = retrieveResource("res/owl/data/conf/full.nt");

// then, obtain pre-processed rules & ontology from web service
// (options: inst_rules, binarize, aux_rules)
preprocess({
	path : path,
	content : ontology, 
	
	syntax : "N-TRIPLE"

}, "inst_rules", function(ret) {
	doLog("rules: " + ret.rules.split(/\r?\n\r?\n/));
	doLog("ontology: " + ret.ontology);
});
