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

// courtesy of http://stackoverflow.com/questions/951791/javascript-global-error-handling
window.onerror = function(msg, url, line, col, error) {
	var extra = !url ? '' : '\nurl: ' + url;
	extra += !line ? '' : '\nline: ' + line;
	extra += !col ? '' : '\ncolumn: ' + col;
	extra += !error ? '' : '\nerror: ' + error;

	var err = "Error: " + msg + extra;
	doLog(err);

	// You can view the information in an alert to see things working like this:
	showError(err);

	// If you return true, then error alerts (like in older versions of
	// Internet Explorer) will be suppressed.
	return true;
};

function busyLoading(msg) {
	doLog("busyLoading: " + msg);

	setTimeout(function() {

		$.mobile.loading('show', {
			'text' : msg,
			'textVisible' : true,

			'theme' : 'b',
			'data-overlay-theme' : 'b',
		});

	}, 1);
}

function doneLoading() {
	setTimeout(function() {

		$.mobile.loading('hide');

	}, 1);
}

function showError(e) {
	doneLoading();

	$.dynamic_popup({
		content : "<b>Error: </b>" + e,

		'data-theme' : 'e',
		'data-overlay-theme' : 'b',
	});
}

// > header part

var reasonContainer, resContainer;
function loadUI() {
}
