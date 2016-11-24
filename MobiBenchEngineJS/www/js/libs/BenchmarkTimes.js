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

function BenchmarkTimes(options) {

	this.str = "";
	this.options = options;

	this.toIgnore = [ 'print', 'collapse', 'finalize', 'merge', 'toIgnore',
			'str', 'options' ];

	this.merge = function(obj, own) {
		if (!own)
			own = this;

		for ( var id in obj) {
			if (obj.hasOwnProperty(id)) {

				if (this.toIgnore.indexOf(id) !== -1)
					continue;

				var otherChild = obj[id];
				if (otherChild.times) {

					if (!own[id])
						own[id] = new ResultTimes;

					var ownChild = own[id];
					ownChild.merge(otherChild);

				} else {
					if (!own[id])
						own[id] = {};

					var ownChild = own[id];
					this.merge(otherChild, ownChild);
				}
			}
		}
	};

	this.finalize = function() {
		if (this.options) {

			if (this.options.indexOf('COLLAPSE_TIMES') !== -1)
				this.collapse();
		}
	},

	this.collapse = function(obj, resultTimes) {
		if (!obj)
			obj = this;

		if (!resultTimes)
			resultTimes = new ResultTimes();

		var ids = [];
		for ( var id in obj) {
			if (this.toIgnore.indexOf(id) === -1 && obj.hasOwnProperty(id)) {
				ids.push(id);

				var obj2 = obj[id];
				if (obj2.times)
					resultTimes.merge(obj2);
				else
					this.collapse(obj2, resultTimes);
			}
		}

		for (var i = 0; i < ids.length; i++)
			delete this[ids[i]];

		if (obj == this)
			this.all = resultTimes;
	}

	this.print = function(options, obj) {
		if (!obj)
			obj = this;

		for ( var id in obj) {
			if (this.toIgnore.indexOf(id) === -1 && obj.hasOwnProperty(id)) {

				var obj2 = obj[id];

				if (obj2.times) {
					this.str += "-- " + id + "\n";
					this.str += obj2.print(options) + "\n\n";

				} else {
					this.str += "-- " + id + "\n";
					this.print(options, obj2);
				}
			}
		}

		return this.str;
	};
}
