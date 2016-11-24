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

ReasonTask = function(engine, config) {

	this.engine = engine;

	this.config = config;
	this.resources = config.resources;
	this.reasoning = config.reasoning;

	this.times = new BenchmarkTimes(this.timeOptions);

	this.createProcessFlow = function(flowConfig) {
		var mechanism = this.reasoning.mechanism[this.reasoning.task];

		var processFlow = mechanism.mainFlow;
		if (!processFlow) {
			mechanism = this.reasoning.mechanism[mechanism.dependency];

			processFlow = mechanism.mainFlow;
		}

		var flow = null;
		switch (processFlow) {

		case 'frequent':
			flow = new FrequentFlow(this.resources, flowConfig);

			break;

		case 'incremental':
			flow = new IncrementalFlow(this.resources, flowConfig);

			break;
		}

		return flow;
	};

	this.updateTimes = function(id, times) {
		if (arguments.length == 1)
			this.times.merge(times);

		else {
			if (!this.times[id])
				this.times[id] = times;
			else
				this.times[id].merge(times);
		}
	};

	this.inferred = function(callback, ontology, inferred, consistent,
			conflicts) {

		this.checkConformance(inferred);

		this.logResults(callback, inferred, consistent, conflicts);
	};

	this.checkConformance = function(inferred) {
		if (!CONF_TEST)
			return;

		function cntFn(conf) {
			conf = conf.replace(/\r/g, "").split("\n");

			if (conf[0].startsWith("id: "))
				conf.splice(0, 1);

			if (!Array.isArray(inferred))
				inferred = inferred.inferred;

			// console.log("conf: "); logArray(conf);

			log.msg("# conf: " + conf.length, LogLvl.INFO);
			log.msg("# inferred: " + inferred.length, LogLvl.INFO);

			var missingInferences = checkOverlaps(conf, inferred);

			if (!emptyArray(missingInferences)) {
				log.msg("missing inferences: ", LogLvl.INFO);

				logArray(missingInferences, LogLvl.INFO);

			} else
				log.msg("no missing inferences", LogLvl.INFO);

			log.rotate();

			// var extraInferences = checkOverlaps(inferred, conf);
			// console.log("extra inferences: "); logArray(extraInferences);
		}

		var conf = null;
		try {
			conf = retrieveResource(CONF_PATH);

		} catch (e) {
			log.msg("confTest file not found: " + CONF_PATH);

			return;
		}

		if (conf == null) {
			log.msg("confTest file not found: " + CONF_PATH);

			return;
		}

		var dataFormat = this.engine.config.resources.data.format;
		if (dataFormat != 'RDF') {
			// since inferences are output with this header, doing this check
			// makes it possible to simply copy-paste output for conformance
			if (conf.startsWith("id:"))
				conf = conf.substring(conf.indexOf("\n") + 1);

			convert(conf, 'data', {
				syntax : 'N-TRIPLE',
				to : dataFormat,

			}, function(output) {
				cntFn(output);
			});

		} else
			cntFn(conf);
	};

	this.logResults = function(callback, inferred) {
		if (!OUTPUT_INF) {
			callback();

			return;
		}

		var id = null;
		var inferences = null;

		if (Array.isArray(inferred))
			inferences = inferred;

		else {
			id = inferred.id;

			inferences = inferred.inferred;
		}

		if (this.config.inferredFilter)
			inferences = this.filterInferred(inferences,
					this.config.inferredFilter);

		if (inferences.length > 0) {
			log.msg("inferences made", LogLvl.INFO);

			var fileName = null;
			if (OUTPUT_PATH)
				fileName = OUTPUT_PATH;
			else
				fileName = this.engine.id.toLowerCase() + "/inferred.txt";

			var content = "";
			if (id)
				content += "id: " + id + "\n";

			content += outputArray(inferences) + "\n\n";
			store(fileName, content, this.config.appendInf, callback);

			// logArray(inferred, LogLvl.INFO);

		} else {
			log.msg("none inferred", LogLvl.INFO);

			callback();
		}
	};

	this.filterInferred = function(inferences, inferredFilter) {
		var removeAll = true;

		for (var i = 0; i < inferences.length; i++) {
			var inf = inferences[i];

			if (inf.indexOf(inferredFilter) !== -1) {
				inferences = [ inf ];
				removeAll = false;

				break;
			}
		}

		if (removeAll)
			inferences = [];

		return inferences;
	};
}
