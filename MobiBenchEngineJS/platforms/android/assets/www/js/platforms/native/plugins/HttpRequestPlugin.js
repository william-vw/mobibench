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

httpRequest = {

	errorMsg : "Error calling httpRequest.{0} (HttpRequestPlugin): {1}",

	post : function(url, headers, data, callback) {
		var self = this;

		// - cordova plugin

		// cordova.exec(callback,
		//
		// function(error) {
		// doLog(self.formatError([ "post", error ]));
		//
		// }, "HttpRequestPlugin", "post", [ url, headers, data ]);

		// - canonical javascript version

		var timeout = config.webService.timeout;
		var xmlHttp = new XMLHttpRequest();

		// check for timeouts manually
		// (xmlHttp.ontimeout does not work on phonegap (Android))
		setTimeout(function() {
			if (xmlHttp.readyState != 4) {
				// xmlHttp readyState ends up at 4 when aborted
				xmlHttp.aborted = true;
				xmlHttp.abort();

				var errorMsg = "Error contacting server: request timed out";
				console.log(errorMsg);
			}

		}, timeout);

		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {

				if (xmlHttp.aborted)
					return;

				switch (xmlHttp.status) {

				case 200:
					if (xmlHttp.responseText) {
						var res = JSON.parse(xmlHttp.responseText);
						// console.log("res? " + JSON.stringify(res, null, 4));

						switch (res.type) {

						case 'ERROR':
							var errorMsg = "Error contacting server: "
									+ JSON.stringify(res, null, 4)

							// throw errorMsg;
							console.log(errorMsg);

							callback();

							break;

						case 'SUCCESS':
							callback(res);

							break;
						}

					} else
						callback();

					break;

				default:
					// NOTE on phonegap (at least, on Android): status is
					// always either 0 or 200
					var errorMsg = "Error contacting server: status '"
							+ xmlHttp.statusText + "' (" + xmlHttp.status + ")";

					throw errorMsg;

					break;
				}
			}
		};

		xmlHttp.open('POST', url, true);

		xmlHttp.setRequestHeader("Content-Type", "text/plain");
		xmlHttp.setRequestHeader("Accept", "text/plain");
		xmlHttp.setRequestHeader("Access-Control-Allow-Origin", "*");

		xmlHttp.send(data);
	},

	formatError : function(args) {
		return formatError(args, this.errorMsg);
	}
};
