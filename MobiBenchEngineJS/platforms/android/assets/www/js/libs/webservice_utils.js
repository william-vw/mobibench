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

function storeFileWs(fileName, contents, append, callback) {
	var urlParams = [ [ 'fileName', fileName ], [ "append", append ] ];

	contactWebService(contents, 'file/store', urlParams, callback);
}

function logWs(msgs) {
	contactWebService(msgs, 'log/', [], function() {
	});
}

function convert(content, type, format, callback) {
	var urlParams = [];
	if (format.to)
		urlParams.push([ 'to', format.to ]);
	if (format.from)
		urlParams.push([ 'from', format.from ]);
	if (format.syntax)
		urlParams.push([ 'syntax', format.syntax ]);
	if (format.includeComments)
		urlParams.push([ 'includeComments', format.includeComments ]);

	contactWebService(content, 'convert/' + type, urlParams, callback);
}

function genConfData(rules, callback, idx) {
	if (!idx)
		idx = 0;

	contactWebService(rules, 'gen/conf', [ [ 'idx', idx ] ], callback);
}

function defaultSelect(rules, axioms, selections, callback) {
	// doLog(JSON.stringify(config));

	var config = {
		rules : rules,
		axioms : axioms,

		selections : selections
	}

	contactWebService(JSON.stringify(config), 'select/default', [], callback);
}

function domainBasedSelect(rules, axioms, ontology, syntax, type, callback) {
	var config = {
		rules : rules,
		axioms : axioms,

		ontology : ontology,

		syntax : syntax,
		type : type
	};

	contactWebService(JSON.stringify(config), 'select/domain', [], callback);
}

function preprocess(ontology, rules, options, callback) {
	var config = {
		ontology : ontology,
		rules : rules,
		options : options
	};

	contactWebService(JSON.stringify(config), 'preprocess/' + options.type, [],
			callback);
}

function contactWebService(postData, urlPath, urlParams, callback) {
	var baseUrl = config.webService.url;
	var timeout = config.webService.timeout;

	function buildUrl(baseUrl, urlPath, urlParams) {
		var url = baseUrl + urlPath;
		if (urlParams.length > 0) {

			url += "?";
			for (var i = 0; i < urlParams.length; i++) {

				if (i > 0)
					url += "&";

				url += urlParams[i][0] + "=" + urlParams[i][1];
			}
		}

		return url;
	}

	var url = buildUrl(baseUrl, urlPath, urlParams);
	doLog("url: " + url);

	httpRequest.post(url, [], postData, function(response) {
		switch (response.type) {

		case 'SUCCESS':
			callback(response.result);

			break;

		case 'ERROR':
			var errorMsg = "Error contacting server: " + response.msg;
			// throw errorMsg;
			doLog(errorMsg);

			callback();

			break;
		}
	});
}
