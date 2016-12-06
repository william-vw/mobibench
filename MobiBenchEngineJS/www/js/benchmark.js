/**
 * Copyright 2016 William Van Woensel
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 * 
 * 
 * @author wvw
 * 
 */

// currently, performance results will always be sent to web service
// whether conformance should be tested
CONF_TEST = false;
CONF_PATH = null;

// whether inferences should be logged
OUTPUT_INF = false;
// path where inferences should be stored(see reason_task.js for default)
OUTPUT_PATH = null;

// whether log output should be persisted (via Web service log function)
LOG_CACHE = true;
// default log level (see js/libs/logging.js)
LOG_LVL = LogLvl.DEBUG;

USING_CACHE = false;

// initBenchmark: initializes the benchmark (load configuration, engine plugin,
// data & rules)
function initBenchmark(bConfig, callback) {

	function getEngine(bConfig, callback) {
		var engineId = bConfig.engine.toLowerCase();

		loadEngine(engineId, callback);
	}

	function getTask(bConfig, engine, callback) {
		var reasoning = bConfig.reasoning;
		var taskIds = [ reasoning.task,
				reasoning.mechanism[reasoning.task].type ];

		loadTask(taskIds, engine, bConfig, callback);
	}

	// getResources: loads all resources (e.g., rules, data) involved
	// in the benchmark, possibly contacting the webservice for conversion
	function getResources(engine, bConfig, callback) {

		function process(collected, callback) {

			performSync(function(processor, callback) {
				processor(collected, callback);

			}, null, null, processors, function() {
				// doLog(JSON.stringify(collected, null, 4));

				callback();
			});
		}

		var processors = [

		function(collected, callback) {
			USING_CACHE = false;

			keyValueDb.retrieve("cache",
			function(CACHE) {
				CACHE = CACHE.value;
	
				if (CACHE == "") {
					log.msg("> CACHE: cannot reuse (empty)");
	
					callback();
					return;
				}
	
				// doLog("supportsCaching? " +
				// collected.supportsCaching);
	
				if (!collected.supportsCaching) {
					log.msg("> CACHE: cannot re-use (supportsCaching = false)");
	
					callback();
					return;
				}
	
				CACHE = JSON.parse(CACHE);
	
				if ((collected.selections ^ CACHE.selections)
					|| (collected.selections && CACHE.selections 
					&& !sameElements(collected.selections, CACHE.selections))) {
	
					log.msg("> CACHE: cannot reuse (different selections)");
	
					callback();
					return;
				}
	
				// doLog("preprocess? " +
				// collected.preprocess + " <> " +
				// CACHE.preprocess);
	
				if (collected.preprocess != CACHE.preprocess) {
					log
							.msg("> CACHE: cannot reuse (different pre-process)");
	
					callback();
					return;
				}
	
				var resources = collected.resources;
				var resources2 = CACHE.resources;
	
				if (resources.length != resources2.length) {
					callback();
	
					return;
				}
	
				var reuse = false;
	
				for (var i = 0; i < resources.length; i++) {
					var resource = resources[i];
	
					// ontology not suitable for re-use
					if (resource.id == 'ontology')
						continue;
	
					var config = engine.config.resources[resource.type];
					var resource2 = resources2[i];
	
					if (resource2.path == resource.path
							&& config.format == resource2.format)
	
						reuse = true;
	
					else {
						log.msg("> CACHE: cannot reuse (different resources)");
						callback();
	
						return;
					}
				}
	
				if (!reuse) {
					log.msg("> CACHE: nothing to reuse");
	
					callback();
					return;
				}
	
				log.msg("> CACHE: reusing");
	
				for (var i = 0; i < resources.length; i++) {
					var resource = resources[i];
					var resource2 = resources2[i];
	
					// don't re-use ontology
					if (resource.id == 'ontology')
						continue;
	
					resources[i].format = resources2[i].format;
					resources[i].content = resources2[i].content;
				}
	
				USING_CACHE = true;
	
				callback();
			});
		},

		function(collected, callback) {
			if (USING_CACHE) {
				callback();

				return;
			}

			if (!bConfig.resources.owl2rl) {
				callback();

				return;
			}

			var owl2rl = bConfig.resources.owl2rl;
			var selections = owl2rl.selections.slice();

			if (selections.length == 0) {
				callback();

				return;
			}

			var rules = owl2rl.rules.content;
			var axioms = owl2rl.axioms.content;

			var domainBased = false;
			for (var i = 0; i < selections.length; i++) {
				var selection = selections[i];

				if (selection == 'domain-based') {
					domainBased = true;

					selections.splice(i--, 1);

				} else
					selections[i] = loadSelectConfig(selection);
			}

			function ctu() {
				owl2rl.rules.content = rules;
				owl2rl.axioms.content = axioms;

				owl2rl.selections = undefined;

				callback();
			}

			log.msg(".. selecting rules & axioms", LogLvl.TRACE);
			defaultSelect(rules, axioms, selections, function(ret) {
				rules = ret.rules;
				axioms = ret.axioms;

				if (domainBased) {
					var ontology = bConfig.resources.ontology.content;

					domainBasedSelect(rules, axioms, ontology,
							"N-TRIPLE", "forward_naive",

							function(ret) {
								rules = ret;

								ctu();
							});
				} else
					ctu();
			});
		},

		function(collected, callback) {
			if (USING_CACHE) {
				callback();

				return;
			}

			var resources = bConfig.resources;

			if (!resources.owl2rl) {
				callback();

				return;
			}

			var owl2rl = resources.owl2rl;
			if (!owl2rl.preprocess) {
				callback();

				return;
			}

			log.msg(".. preprocessing (" + owl2rl.preprocess + ")",
					LogLvl.TRACE);

			preprocess(resources.ontology, owl2rl.rules.content, 
				{ 
					type : owl2rl.preprocess,
					outputRules : bConfig.outputRules,
					outputPath : bConfig.outputPath
				},
				function(ret) {
					if (ret.ontology)
						resources.ontology.content = ret.ontology;
	
					if (ret.rules)
						owl2rl.rules.content += "\n\n" + ret.rules;
	
					callback();
			});
		},

		function(collected, callback) {

			performSync(
				function(resource, callback) {

					if (!resource.content) {
						log.msg("empty resource: " + resource.id,
								LogLvl.TRACE);

						var config = engine.config.resources[resource.type];
						resource.format = config.format;

						callback();
						return;
					}

					// doLog("convert: " + JSON.stringify(resource,
					// null, 4));
					convertResource(resource, function() {
						handleRawResource(resource);

						callback();
					});

				}, null, null, collected.resources, callback);
		},

		function(collected, callback) {
			if (!USING_CACHE) {

				if (!collected.supportsCaching) {
					log.msg("> CACHE: not storing (supportsCaching = false)");

					callback();

				} else if (collected.selections
						&& contains(collected.selections, 'domain-based')) {

					log.msg("> CACHE: not storing (domain-based selection)");

					callback();

				} else if (collected.resources[0].composed) {
					log.msg("> CACHE: not storing (composed resources)");

					callback();

				} else
					keyValueDb.store("cache", JSON.stringify(collected,
							null, 4), callback);

			} else
				callback();
		} ];

		function convertResource(resource, callback) {
			var config = engine.config.resources[resource.type];

			if (resource.format != config.format) {
				log.msg(".. converting " + resource.format + " => "
						+ config.format, LogLvl.TRACE);

				convert(resource.content, resource.type, {
					syntax : resource.syntax,
					to : config.format,

					includeComments : (resource.composed ? true : false)

				}, function(output) {
					resource.format = config.format;
					resource.content = output;

					callback();
				});

			} else
				callback();
		}

		function handleRawResource(resource) {

			function doToArray(content) {
				if (isArray(content))
					return content;

				// remove Windows line breaks
				content = content.replace(/\r/g, "");
				content = content.trim().split(
						(resource.type == 'rules' ? "\n\n" : "\n"));

				return content;
			}

			var content = resource.content;
			var config = engine.config.resources[resource.type];

			if (resource.composed) {
				// log.msg("expanding: " + content);

				content = splitResource(resource, content);
				log.msg("expanded #" + content.length, LogLvl.DEBUG);

				if (config.toArray) {

					for (var i = 0; i < content.length; i++)
						content[i].content = doToArray(content[i].content);
				}
			}

			if (config.toArray)
				content = doToArray(content);

			resource.content = content;
		}

		// try {
		function collectResources(resources) {
			var ret = {
				resources : [],
				selections : null
			}

			doCollect(resources, ret);

			return ret;
		}

		function doCollect(resources, ret) {
			// doLog("r:\n" + JSON.stringify(resources, null, 4));

			for ( var id in resources) {
				if (resources.hasOwnProperty(id)) {

					var resource = resources[id];
					if (resource.path !== undefined) {
						resource.id = id;

						ret.resources.push(resource);

					} else if (id == "selections" || id == "preprocess"
							|| id == "supportsCaching")

						ret[id] = resource;

					else {
						if (isObject(resource))
							doCollect(resource, ret);
					}
				}
			}
		}

		function getResources(resources) {
			for (var i = 0; i < resources.length; i++) {
				var resource = resources[i];

				resource.content = retrieveResource(resource.path);
			}
		}

		var collected = collectResources(bConfig.resources);
		getResources(collected.resources);

		process(collected, callback);

		// } catch (err) {
		// callback(err);
		// }
	}

	// start benchmark initialization

	// add extra run to warm-up device
	if (bConfig.warmupRun)
		bConfig.nrRuns++;

	CONF_TEST = (bConfig.confTest ? true : false);
	CONF_PATH = bConfig.confPath;
	OUTPUT_INF = (bConfig.outputInf ? true : false);
	OUTPUT_PATH = bConfig.outputPath;

	log.msg("params? " + CONF_TEST + "; " + CONF_PATH + "; " + OUTPUT_INF
			+ "; " + OUTPUT_PATH, LogLvl.INFO);

	// load engine (including libraries, if any)
	log.msg("loading engine..", LogLvl.INFO);
	getEngine(bConfig, function(engine) {

		// load task
		log.msg("loading task..", LogLvl.INFO);
		getTask(bConfig, engine, function(task) {

			// load resources
			log.msg("loading resources..", LogLvl.INFO);
			getResources(engine, bConfig, function(msg) {
				if (msg)
					callback(msg);
				else
					callback(task, engine, bConfig);
			});
		});
	});
}

// runBenchmark: executes the benchmark
function runBenchmark(task, engine, bConfig, doneCb) {

	// performRun: performs a single run of the reasoning task and recursively
	// calls itself until no more runs are needed
	function performRun(curRun) {
		if (curRun > 0)
			log.msg("\n", LogLvl.INFO);

		if (curRun < bConfig.nrRuns) {
			log.msg(">> Benchmark: " + bConfig.engine + "\n", LogLvl.INFO);
			log.msg("-- Run:  " + curRun + "\n", LogLvl.INFO);

			// setTimeout(function() {
			// try {
			engine.reset(function() {

				task.runBenchmark(function() {
					if (curRun == 0 && bConfig.dumpHeap)

						engine.dumpHeap(bConfig.id, function() {
							performRun(curRun + 1);
						});

					else
						performRun(curRun + 1);
				});
			});

			// } catch (e) {
			// log.msg("Error performing benchmark: " + e.stack, LogLvl.ERROR);
			// }

			// }, (curRun == 0 ? 0 : 1000));

		} else {
			task.times.finalize();

			var printOptions = [];
			// drop first warm-up run
			if (bConfig.warmupRun)
				printOptions.push('DROP_FIRST_RUN');

			var times = task.times.print(printOptions);

			var fileName = bConfig.engine + "/" + bConfig.id + ".txt";
			store(fileName, times, false, function() {

				log.msg(times, LogLvl.INFO);
				log.rotate();

				engine.destroy(function() {

					doneCb();
				});
			});
		}
	}

	// start benchmark execution

	// check whether the config is structured correctly
	if (task.checkConfig(bConfig)) {

		// perform the benchmark runs
		performRun(0);
	}
}

// start benchmark
function execBenchmark(bConfig, doneCb) {
	// else, get StackOverflowError on Nashorn (JDK 8)
	var doneCb2 = function() {
		setTimeout(function() {
			doneCb();

		}, 1);
	}

	log.msg("config:\n" + JSON.stringify(bConfig, null, 4));

	if (bConfig.config)
		copyTo(bConfig.config, config);

	// first, initialize the benchmark
	log.msg("initializing the benchmark..\n", LogLvl.INFO);
	initBenchmark(bConfig, function() {

		if (arguments.length == 1) {
			var msg = arguments[0];

			log.msg("skipping benchmark: " + msg, LogLvl.INFO);
			log.rotate();

			doneCb2();

			return;
		}

		var task = arguments[0];
		var engine = arguments[1];
		var bConfig = arguments[2];

		// then, run the benchmark
		log.msg("\nrunning the benchmark..", LogLvl.INFO);

		runBenchmark(task, engine, bConfig, doneCb2);
	});
}