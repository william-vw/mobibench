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

callbackPlugin = {

	errorMsg : "Error calling callbackPlugin.{0} (CallbackPlugin): {1}",

	doneLoading : function(callback) {
		var self = this;

		cordova.exec(function(fnStr) {
			callback(new Function(fnStr));
		},

		function(error) {
			doLog(self.formatError([ "doneLoading", error ]));

		}, "CallbackPlugin", "doneLoading", []);
	},

	benchmarkDone : function(callback) {
		var self = this;

		cordova.exec(callback,

		function(error) {
			doLog(self.formatError([ "benchmarkDone", error ]));

		}, "CallbackPlugin", "benchmarkDone", []);
	},

	formatError : function(args) {
		return formatError(args, this.errorMsg);
	}
};
