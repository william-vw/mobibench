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

package wvw.mobibench.service.preproc;

import wvw.mobibench.service.res.ServiceResources;
import wvw.utils.timer.ExperimentTimer;

public abstract class PreProcessor {

	protected String rootPath = "res/preprocess/";
	protected ServiceResources res;

	protected PreProcessor(ServiceResources res) {
		this.res = res;
	}

	public PreProcessResults preprocess(PreProcessConfig config)
			throws PreProcessException {

		ExperimentTimer timer = new ExperimentTimer(getType().toString());
		timer.begin();

		PreProcessResults ret = doPreprocess(config);
		timer.done();

		res.store("preprocess", config.getOntology(), timer.getTime());

		return ret;
	}

	public abstract PreProcessResults doPreprocess(PreProcessConfig config)
			throws PreProcessException;

	public abstract PreProcessTypes getType();
}
