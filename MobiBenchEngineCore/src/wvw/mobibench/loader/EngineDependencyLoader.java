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

package wvw.mobibench.loader;

import wvw.mobibench.engine.ReasoningEngine;
import wvw.mobibench.exception.LoadingException;

public abstract class EngineDependencyLoader {

	protected ReasoningEngine currentEngine = null;

	protected boolean check(String engineId) throws LoadingException {
		if (currentEngine != null) {

			if (currentEngine.getId().equals(engineId))
				return false;
			else
				throw new LoadingException("already loaded another engine - please restart");
		}

		return true;
	}

	protected boolean alreadyLoaded(String engineId) {
		return currentEngine.getId().equals(engineId);
	}

	protected String jarName(String engineId) {
		return engineId.toLowerCase() + ".jar";
	}

	public abstract ReasoningEngine load(String engineId) throws LoadingException;
}
