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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.hp.hpl.jena.rdf.model.Model;

import wvw.mobibench.service.preproc.PreProcessConfig;
import wvw.mobibench.service.preproc.PreProcessConfig.Ontology;
import wvw.mobibench.service.preproc.PreProcessTypes;
import wvw.mobibench.service.preproc.ont.inst_rules.handler.DefaultHandler;
import wvw.mobibench.service.preproc.ont.inst_rules.handler.HasKeyHandler;
import wvw.mobibench.service.preproc.ont.inst_rules.handler.IntersectionHandler;
import wvw.mobibench.service.preproc.ont.inst_rules.handler.PropertyChainHandler;
import wvw.mobibench.service.res.ServiceResources;
import wvw.utils.rule.RuleWrapper;

public class InstantiateAllPreProcessor extends InstantiatePreProcessor {

	private List<String> instableRules = new ArrayList<String>();
	private List<String> supportRules = new ArrayList<String>();

	public InstantiateAllPreProcessor(ServiceResources res) {
		super(res);

		try {
			loadIds("instable-rules.spin", instableRules);
			loadIds("support-rules.spin", supportRules);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected Model getModel(PreProcessConfig config) throws IOException {
		Ontology ontology = config.getOntology();

		// require hasMember inferences for instantiating some rules
		// (e.g., #cls-int2, #cls-uni)
		return loadInfModel(ontology.getContent(), ontology.getSyntax(), loadRulesAsString("support-rules.spin"));
	}

	protected List<RuleWrapper> getRules(PreProcessConfig config) throws IOException {
		List<RuleWrapper> rules = config.getRuleObjs();
		// NOTE add special n-ary rules here
		rules.addAll(loadRules("n-ary-rules.spin"));

		return rules;
	}

	protected boolean checkRule(RuleWrapper rule, Iterator<RuleWrapper> ruleIt) {
		if (instableRules.contains(rule.getComment()))
			return true;

		if (supportRules.contains(rule.getComment()))
			ruleIt.remove();

		return false;
	}

	protected void initMap() {
		idMap.put("# cls-int1", new IntersectionHandler());
		idMap.put("# prp-spo2", new PropertyChainHandler());
		idMap.put("# prp-key", new HasKeyHandler());

		idMap.put(null, new DefaultHandler());
	}

	public PreProcessTypes getType() {
		return PreProcessTypes.INST_ALL_RULES;
	}
}
