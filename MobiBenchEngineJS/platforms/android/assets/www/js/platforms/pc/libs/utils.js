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

// courtesy of 
// https://gist.github.com/salomvary/5a295d32e0868ffde42a

(function() {

	var Timer = Java.type('java.util.Timer');
	var Phaser = Java.type('java.util.concurrent.Phaser');

	var timer = new Timer('jsEventLoop', false);
	var phaser = new Phaser();

	var onTaskFinished = function() {
		phaser.arriveAndDeregister();
	};

	setTimeout = function(fn, millis) {
		var self = null;
		
		var args = [].slice.call(arguments, 2, arguments.length);
		if (args.length > 0) {
			
			self = args[0];
		}
		
		var phase = phaser.register();
		var canceled = false;

		timer.schedule(function() {
			if (canceled)
				return;

			try {
				fn.call(self);

			} catch (e) {
				print(e);

			} finally {
				onTaskFinished();
			}

		}, millis);

		return function() {
			onTaskFinished();

			canceled = true;
		};
	}

})();
