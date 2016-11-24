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

keyValueDb = {

	pc : Java.type('wvw.mobibench.call.plugins.KeyValueDbPlugin'),
	errorMsg : "Error calling keyValueDb.{0} (KeyValueDbPlugin): {1}",
		
	store : function(key, value, callback) {
		this.pc.store(key, value);
		
		callback();
	},

	retrieve : function(key, callback) {
		var ret = this.pc.retrieve(key);
		ret = JSON.parse(ret);
		
		callback(ret);
	},

	formatError : function(args) {
		return formatError(args, this.errorMsg);
	}
};
