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

package wvw.mobibench.service.preproc.aux_rules;

import java.io.IOException;

import wvw.mobibench.service.preproc.PreProcessConfig;
import wvw.mobibench.service.preproc.PreProcessException;
import wvw.mobibench.service.preproc.PreProcessResults;
import wvw.mobibench.service.preproc.PreProcessTypes;
import wvw.mobibench.service.preproc.PreProcessor;
import wvw.mobibench.service.res.ServiceResources;

public class AuxiliaryRulesPreProcessor extends PreProcessor {

	public AuxiliaryRulesPreProcessor(ServiceResources res) {
		super(res);
	}

	public PreProcessResults doPreprocess(PreProcessConfig config)
			throws PreProcessException {

		try {
			String rules = res
					.getContents(rootPath + "aux_rules/rules.spin");
			
			return new PreProcessResults(rules);

		} catch (IOException e) {
			throw new PreProcessException(e);
		}
	}
	
	public PreProcessTypes getType() {
		return PreProcessTypes.AUX_RULES;
	}
}
