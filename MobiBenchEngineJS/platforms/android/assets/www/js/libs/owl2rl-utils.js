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

function loadSelectConfig(name) {
	var path = "res/owl/owl2rl/" + name + "/";

	var config = {};

	var resources = retrieveResource(path + "res").split("\n");
	for (var i = 0; i < resources.length; i++) {
		var resource = resources[i].trim();

		if (resource == "")
			continue;

		config[resource] = retrieveResource(path + resource);
	}

	return config;
}
