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

function ComposedIterableObject(obj, toIgnore) {
	var array = [];

	for ( var id in obj) {
		if (obj.hasOwnProperty(id)) {

			if (!toIgnore || toIgnore.indexOf(id) == -1) {
				var el = obj[id];

				if (Array.isArray(el))
					array.push({
						id : id,
						array : el
					});
				else
					array.push(el);
			}
		}
	}

	this.iterator = new ComposedIterableArray(array, 
		
		function(el) {
			return el.array;
		},
		
		function() {
			return {};
		},
		
		function(el, value, entry) {
			entry[el.id] = value;
		});

	this.hasNext = function() {
		return this.iterator.hasNext();
	}

	this.next = function() {
		return this.iterator.next();
	}
}
