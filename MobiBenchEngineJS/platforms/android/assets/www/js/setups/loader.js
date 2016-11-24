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

function loadSetups(callback, setups, path, scripts) {
	var firstLvl = false;

	if (!scripts) {
		scripts = [];
		setups = { 
			root : setups
		};

		firstLvl = true;
	}

	for ( var id in setups) {
		if (setups.hasOwnProperty(id)) {

			var setup = setups[id];
			if (typeof setup != 'object')
				continue;

			var recPath = path;
			cntFn = function() {
				loadSetups(callback, setup, recPath, scripts);
			};

			if (setup.folder)
				recPath += setup.folder;

			if (setup['sub_flows']) {
				cntFn();

				cntFn = null;
			}

			if (setup.file)
				scripts.push(recPath + setup.file);

			if (cntFn != null)
				cntFn();
		}
	}

	if (firstLvl) {
//		console.log("setup scripts: " + JSON.stringify(scripts));

		loadScripts(scripts, callback);
	}
}
