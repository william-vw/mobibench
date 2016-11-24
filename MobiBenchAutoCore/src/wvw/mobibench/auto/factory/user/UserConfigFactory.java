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

package wvw.mobibench.auto.factory.user;

import java.util.List;

import wvw.mobibench.run.config.OWL2RLRunConfig;
import wvw.mobibench.run.config.OWLBuiltinRunConfig;
import wvw.mobibench.run.config.RuleBasedServiceMatchConfig;

public abstract class UserConfigFactory {

	protected String localPath;
	protected String remotePath;

	public void setLocalPath(String localPath) {
		this.localPath = localPath;
	}

	public void setRemotePath(String remotePath) {
		this.remotePath = remotePath;
	}

	public abstract List<OWL2RLRunConfig> user_OWL2RL();

	public abstract List<OWLBuiltinRunConfig> user_OWLBuiltin();
	
	public abstract List<RuleBasedServiceMatchConfig> user_ruleBasedServiceMatching();
}
