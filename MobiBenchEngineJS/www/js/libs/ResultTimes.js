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

function ResultTimes() {
	this.times = {};

	this.add = function(type, time) {

		if (this.times[type] === undefined)
			this.times[type] = [];

		this.times[type].push(time);
	};

	this.merge = function(resultTimes) {
		for ( var type in resultTimes.times) {
			if (resultTimes.times.hasOwnProperty(type)) {

				if (this.times[type] !== undefined) {
					var typeTimes = resultTimes.times[type];

					for (var i = 0; i < typeTimes.length; i++)
						this.times[type].push(typeTimes[i]);

				} else
					this.times[type] = resultTimes.times[type];
			}
		}
	};

	this.print = function(options) {
		var str = "> totals and averages: \n";
		str += "(all: " + JSON.stringify(this.times) + ")\n";

		for ( var type in this.times) {
			if (this.times.hasOwnProperty(type)) {

				var typeTimes = this.times[type];

				if (options.indexOf('DROP_FIRST_RUN') !== -1)
					typeTimes.splice(0, 1);

				var total = 0;
				for (var i = 0; i < typeTimes.length; i++)
					total += typeTimes[i];

				var avg = total / typeTimes.length;

				str += type + ": " + total + "; " + "avg: " + avg + "\n";
			}
		}

		return str;
	};
}
