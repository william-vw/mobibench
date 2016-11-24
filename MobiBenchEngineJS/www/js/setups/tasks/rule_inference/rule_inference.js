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

RuleInference = function(engine, config) {

	ReasonTask.call(this, engine, config);
	
	this.checkConfig = function(config) {
		var resources = config.resources;

		if (resources.data === undefined) {
			log.msg("Error: expected data in benchmark resources", LogLvl.ERROR);

			return false;

		} else if (resources.rules === undefined) {
			log.msg("Error: expected rules in benchmark resources", LogLvl.ERROR);

			return false;

		} else
			return true;
	}
}
