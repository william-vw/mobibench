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
package wvw.mobibench.timer;

import wvw.utils.timer.ExperimentTimer;
import wvw.utils.timer.ResultTime;
import wvw.utils.timer.ResultTimes;

public class EngineExperimentTimer extends ExperimentTimer {

	public EngineExperimentTimer(String id) {
		super(id);
	}

	public EngineExperimentTimer(String id, ResultTimes resultTimes) {
		super(id, resultTimes);
	}

	protected ResultTimes createTimes() {
		return new EngineResultTimes();
	}
	
	protected ResultTime createTime(String id, long length) {
		return new EngineResultTime(id, length);
	}
}
