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

package wvw.utils.log;

import java.util.List;
import java.util.Vector;

public class LogDelegator extends Logger {

	public static final int TYPE = getUniqueLoggerTypeId();
	
	private List<Logger> loggers = new Vector<Logger>();
	
	public LogDelegator() {
		super(TYPE);
	}
	
	public LogDelegator(Logger ... loggers) {
		super(TYPE);
		
		for (Logger logger : loggers)
			this.loggers.add(logger);
	}
	
	public void addLogger(Logger logger) {
		loggers.add(logger);
	}
	
	protected void logString(String str) {
		for (int i = 0; i < loggers.size(); i++) {
			Logger logger = loggers.get(i);
			logger.log(str);
		}
	}
}
