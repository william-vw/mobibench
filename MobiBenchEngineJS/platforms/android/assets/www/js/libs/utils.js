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

// 2 methods below assume moment.js was loaded
function millis(dateTime) {
	var idx = dateTime.indexOf("^^");
	if (idx > 0)
		dateTime = dateTime.substring(1, idx - 1);

	return moment(dateTime, "YYYY-MM-DDThh:mm:ssZ").valueOf();
}

function after(dateTime1, dateTime2) {
	return millis(dateTime1) > millis(dateTime2);
}

function stringifyOperands(string) {
	var operands = string.split(",");

	var strOperands = "";
	for (var i = 0; i < operands.length; i++) {
		var operand = operands[i].trim();

		if (i > 0)
			strOperands += ", ";

		strOperands += "\"" + operand + "\"";
	}

	return strOperands;
}

function endsWith(str, suffix) {
	return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function objSize(obj) {
	var size = 0;
	for ( var key in obj) {
		if (obj.hasOwnProperty(key))
			size++;
	}

	return size;
};

function loadScripts(paths, callback) {
	performSync(loadScript, this, null, paths, callback);
}

function loadJson(name, callback) {
	// doLog("loadJson: " + name);

	var json = retrieveResource(name);

	return JSON.parse(json);
}

function performSync(asyncFn, self, defArgs, seqArgs, callback, itemCb, logCt,
		logMsg) {

	var ctr = 0;

	var getCurArgs = function(cntFn) {
		var curArgs = (defArgs ? defArgs.slice() : []);

		curArgs.push(seqArgs[ctr++]);
		curArgs.push(cntFn);

		return curArgs;
	};

	var cntFn = function() {
		if (itemCb)
			itemCb(arguments);

		if (ctr % logCt == 0)
			doLog(logMsg + ": " + ctr);

		if (ctr == seqArgs.length)
			callback();

		else
			asyncFn.apply(self, getCurArgs(cntFn));
	};

	if (seqArgs.length == 0)
		callback();
	else
		asyncFn.apply(self, getCurArgs(cntFn));
}

function CntAsynCb(cnt, callback) {
	return function() {

		if (--cnt == 0)
			optCb(callback);
	};
}

function applyOnEach(arrays1, arrays2, call, cb) {
	var idx1 = 0;
	var idx2 = 0;

	function ctuFn() {

		if (idx1 < arrays1[0].length) {
			var a1 = arrays1.map(function(array1) {
				return array1[idx1];
			});

			if (idx2 < arrays2[0].length) {
				var a2 = arrays2.map(function(array2) {
					return array2[idx2];
				});

				call.fn.call(call.target, a1, a2,

				function() {
					idx2++;

					ctuFn();

				}, idx1, idx2);

			} else {
				idx1++;
				idx2 = 0;

				ctuFn();
			}

		} else
			cb.call(call.target);
	}

	ctuFn();
}

function evalNReturn(string) {
	string = "ret = " + string;
	eval(string);

	var ret1 = ret;
	ret = null;

	return ret1;
}

if (!String.prototype.format)
	String.prototype.format = function() {

		var args = arguments;
		var regex = /\{(\d+)\}/g;

		var fn = function(match, number) {
			return number in args ? args[number] : match;
		};

		return this.replace(regex, fn);
	};

function myClone(obj) {
	var copy = {};

	for ( var field in obj) {
		if (obj.hasOwnProperty(field))
			copy[field] = obj[field];
	}

	return copy;
}

function myDeepClone(obj) {
	return JSON.parse(JSON.stringify(obj));
}

function myArrayCopy(array) {
	var newArray = [];

	for (var i = 0; i < array.length; i++)
		newArray.push(array[i]);

	return newArray;
}

function copyTo(obj1, obj2) {
	for ( var id1 in obj1) {
		if (obj1.hasOwnProperty(id1)) {

			if (typeof obj1[id1] == 'object'
					&& (obj2.hasOwnProperty(id1) && typeof obj2[id1] == 'object'))

				copyTo(obj1[id1], obj2[id1]);
			else
				obj2[id1] = obj1[id1];
		}
	}
}

function searchObj(searchId, obj, callback) {
	for ( var id in obj) {
		if (obj.hasOwnProperty(id)) {

			var value = obj[id];
			if (id == searchId)
				callback(obj, value);

			if (typeof value == 'object')
				searchObj(searchId, value, callback);
		}
	}
}

function logStr(str) {
	var limit = 1000;

	while (str.length > 0) {
		log.msg(str.substring(0, limit), LogLvl.INFO);

		str = str.substring(limit);
	}
}

function logArray(array, logLvl) {
	for (var i = 0; i < array.length; i++) {
		var str = array[i];

		var limit = 1000;
		while (str.length > 0) {
			log.msg(str.substring(0, limit), logLvl);

			str = str.substring(limit);
		}
	}
}

function outputArray(array) {
	var output = "";

	for (var i = 0; i < array.length; i++) {
		var str = array[i];

		output += str + "\n";
	}

	return output;
}

function mergeResources() {
	var content = null;

	for (var i = 0; i < arguments.length; i++) {
		var arg = arguments[i];

		if (content == null)
			content = arg.content;

		else {
			if (content instanceof Array)
				content = content.concat(arg.content);
			else
				content += "\n" + arg.content;
		}
	}

	var arg = arguments[0];
	return {
		id : arg.id,
		content : content,
		type : arg.type,
		format : arg.format,
		syntax : arg.syntax
	};
}

function splitResource(composedRes, str) {
	var resources = [];

	str = str.replace(/\r/g, "");
	var contents = str.split("\n\n#");

	for (var i = 0; i < contents.length; i++) {
		var content = contents[i];
		var idx = content.indexOf("\n");

		var id = content.substring(0, idx).replace(/#/g, "").trim();
		content = content.substring(idx + 1);

		var resource = {
			id : id,
			content : content
		};

		switch (composedRes.type) {

		case 'data':
			resource.syntax = composedRes.syntax;

		case 'rules':
			resource.type = composedRes.type;
			resource.format = composedRes.format;

			break;
		}

		resources.push(resource);
	}

	return resources;
}

function executePageScript(script) {
	var scriptEl = document.createElement("script");
	scriptEl.src = script;

	var body = document.getElementsByTagName("body").item(0);
	body.appendChild(scriptEl);
}

function getEngine(engineId, callback) {
	doLog("getting engine ..");

	engineId = engineId.toLowerCase();

	// load engine plugin
	var enginePath = "js/engines/" + engineId + "/";
	loadScript(enginePath + engineId + ".js", function() {

		// in case of native engine, wrap proxy around engine
		if (engine.config.native) {
			engine = new Proxy(engine);

			engine.initConfig(function() {

				callback(engine);
			});

		} else
			callback(engine);
	});
}

// loadEnginePlugin: loads the plugin of the engine to be benchmarked
function loadEnginePlugin(engineId, callback) {
	doLog("loading engine plugin..");

	engineId = engineId.toLowerCase();

	// load engine plugin
	var enginePath = "js/engines/" + engineId + "/";
	loadScript(enginePath + engineId + ".js", function() {

		// load engine libraries
		loadScripts(engine.config.libs, function() {

			// in case of native engine, wrap proxy around engine
			if (engine.config.native)
				engine = new Proxy(engine);

			// initialize the engine
			engine.init(callback);
		});
	});
}

function applyTo(element, callback) {
	if (typeof element == 'object')

		for ( var idx in element)
			callback(element[idx]);
	else
		callback(element);
}

function checkOverlaps(set1, set2) {
	var noOverlaps = [];

	for ( var idx1 in set1) {
		var el1 = set1[idx1];

		var found = false;
		for ( var idx2 in set2) {
			var el2 = set2[idx2];

			if (el1 == el2) {
				found = true;

				break;
			}
		}

		if (!found)
			noOverlaps.push(el1);
	}

	return noOverlaps;
}

function emptyArray(array) {
	if (array.length == 0)
		return true;

	for (var i = 0; i < array.length; i++) {

		if (array[i] != "")
			return false;
	}

	return true;
}

function contains(array, el) {
	for (var i = 0; i < array.length; i++)

		if (array[i] == el)
			return true;

	return false;
}

function sameElements(array1, array2) {
	if (array1.length != array2.length)
		return false;

	for (var i = 0; i < array1.length; i++)

		if (!contains(array2, array1[i]))
			return false;

	return true;
}

function formatError(args, errorMsg) {
	args = args.map(function(el) {
		return JSON.stringify(el, null, 4);
	});

	return errorMsg.format.apply(errorMsg, args);
}

function collectIds(obj) {
	var ids = [];

	for ( var id in obj) {

		if (obj.hasOwnProperty(id))
			ids.push(id)
	}

	return ids;
}

function collectElementProperties(array, property) {
	var values = [];

	if (array == undefined)
		return values;
	
	for (var i = 0; i < array.length; i++) {
		var el = array[i];

		values.push(el[property]);
	}

	return values;
}

// courtesy of
// http://stackoverflow.com/questions/4775722/check-if-object-is-array
if (typeof Array.isArray === 'undefined') {
	Array.isArray = function(obj) {
		return Object.prototype.toString.call(obj) === '[object Array]';
	}
};

// courtesy of
// http://stackoverflow.com/questions/8511281/check-if-a-variable-is-an-object-in-javascript
function isObject(obj) {
	return obj === Object(obj)
			&& Object.prototype.toString.call(obj) !== '[object Array]';
}

function isArray(obj) {
	return Object.prototype.toString.call(obj) === '[object Array]';
}

if (typeof Object.instantiate === 'undefined') {
	Object.instantiate = function(cons, args) {
		var obj = new Object();

		if (!args)
			cons.call(obj);
		else
			cons.apply(obj, args);

		return obj;
	}
}
