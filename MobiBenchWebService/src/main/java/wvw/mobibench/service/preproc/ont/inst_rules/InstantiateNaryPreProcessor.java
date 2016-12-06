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

package wvw.mobibench.service.preproc.ont.inst_rules;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import com.hp.hpl.jena.rdf.model.Model;

import wvw.mobibench.service.preproc.PreProcessConfig;
import wvw.mobibench.service.preproc.PreProcessConfig.Ontology;
import wvw.mobibench.service.preproc.PreProcessTypes;
import wvw.mobibench.service.preproc.ont.inst_rules.handler.HasKeyHandler;
import wvw.mobibench.service.preproc.ont.inst_rules.handler.IntersectionHandler;
import wvw.mobibench.service.preproc.ont.inst_rules.handler.PropertyChainHandler;
import wvw.mobibench.service.res.ServiceResources;
import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.RulesUtils;

public class InstantiateNaryPreProcessor extends InstantiatePreProcessor {

	public InstantiateNaryPreProcessor(ServiceResources res) {
		super(res);
	}

	protected Model getModel(PreProcessConfig config) throws IOException {
		Ontology ontology = config.getOntology();

		return loadModel(ontology.getContent(), ontology.getSyntax());
	}

	protected List<RuleWrapper> getRules(PreProcessConfig config) throws IOException {
		return RulesUtils.splitRules(res.getContents(rootPath + "inst_rules/n-ary-rules.spin"));
	}

	protected boolean checkRule(RuleWrapper rule, Iterator<RuleWrapper> ruleIt) {
		return true;
	}

	public PreProcessTypes getType() {
		return PreProcessTypes.INST_NARY_RULES;
	}

	protected void initMap() {
		idMap.put("# cls-int1", new IntersectionHandler());
		idMap.put("# prp-spo2", new PropertyChainHandler());
		idMap.put("# prp-key", new HasKeyHandler());
	}
}
