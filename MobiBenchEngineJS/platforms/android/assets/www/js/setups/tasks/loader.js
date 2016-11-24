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

var tasks = null;

function loadTasks(callback) {
	var path = "js/setups/tasks/";
	tasks = loadJson(path + "tasks.json");

	loadSetups(callback, tasks, path);
}

function loadTask(taskIds, engine, config, callback, idx, tasks2) {	
	if (!tasks2) {
		tasks2 = tasks;

		idx = 0;
	}

	for ( var id in tasks2) {
		if (tasks2.hasOwnProperty(id)) {
			var task = tasks2[id];
			
			if (typeof task != 'object')
				continue;

			if (id == taskIds[idx]) {

				if (idx == taskIds.length - 1) {
					var consFn = eval(task.cons);					
					var args = [ engine, config ];

					var taskObj = Object.instantiate(consFn, args);

					callback(taskObj);

				} else
					loadTask(taskIds, engine, config, callback, idx + 1, task);

				break;
			}
		}
	}
}
