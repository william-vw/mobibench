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

LogLvl = {
	DEBUG : 0,
	TRACE : 1,
	INFO : 2,
	WARNING : 3,
	ERROR : 4
};

log = {
		
	cache : {
		log : "",
		length : 0,
		
		limit : 100,
		
		add : function(msg) {
			this.log += msg + "\n";
			
			if (++this.length == this.limit) {
				logWs(this.log);
				
				this.reset();
			}
		},

		rotate : function() {
			if (this.length > 0) {
				logWs(this.log);
				
				this.reset();
			}
		},
		
		reset : function() {
			this.log = ""; this.length = 0;
		}
	},
		
	msg : function(msg, level) {
		if (level === undefined)
			level = LogLvl.DEBUG;
		
		if (level >= LOG_LVL) {
			doLog(msg);
			
			if (LOG_CACHE)
				this.cache.add(msg);		
		}
	},
	
	rotate : function() {
		this.cache.rotate();
	}
};
