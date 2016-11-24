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
package wvw.mobibench.service.convert;

import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.model.Construct;

import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.RulesUtils;

public abstract class RuleConverter extends Converter {

	public RuleConverter(String id) {
		super(id);
	}

	public Object convertRules(String rulesStr) throws ConvertException {
		return convertRules(rulesStr, new ConvertConfig(false, false));
	}

	@SuppressWarnings("unchecked")
	public Object convertRules(String rulesStr, ConvertConfig config)
			throws ConvertException {

		Object results = null;
		if (config.isToString())
			results = new StringBuffer();
		else
			results = new ArrayList<Object>();
		
		List<RuleWrapper> rules = RulesUtils.splitRules(rulesStr);		
		for (int i = 0; i < rules.size(); i++) {
			RuleWrapper rule = rules.get(i);
			
			List<Object> convRules = convertRule(rule.getRule());
			if (config.isToString()) {
				String result = RulesUtils.mergeRules(rule, convRules, config.isIncludeComments());

				((StringBuffer) results).append(result);

			} else
				((List<Object>) results).addAll(convRules);
		}

		reset();

		if (config.isToString())
			results = results.toString();

		return postProcessRules(results);
	}

	public List<Object> convertRules(List<Object> rules) throws ConvertException {
		List<Object> ret = new ArrayList<Object>();
		for (Object rule : rules)
			ret.addAll(convertRule(rule));

		return ret;
	}

	public abstract List<Object> convertRule(Object rule)
			throws ConvertException;

	protected Construct genConstruct(String constructQuery)
			throws ConvertException {

		return RulesUtils.genConstruct(constructQuery);
	}

	protected Object postProcessRules(Object rules) {
		return rules;
	}

	public static void main(String[] args) throws Exception {
		// // String q =
		// "ASK WHERE { ?arg1 <http://jena.hpl.hp.com/ARQ/list#member> ?p . OPTIONAL { ?arg2 ?p ?z1 . } . OPTIONAL { ?arg3 ?p ?z2 . } . FILTER (((!bound(?z1)) || (!bound(?z2))) || (?z1 != ?z2)) . }";
		// String q =
		// "ASK WHERE { ?arg2 list:member ?object . NOT EXISTS { ?arg1 a ?object . } . }";
		// Model model = ModelFactory.createDefaultModel();
		//
		// model.read(new FileReader(Config.path + "res/functions.spin"), "",
		// "N3");
		//
		// Query arqQuery = ARQFactory.get().createQuery(model, q);
		//
		// ARQ2SPIN arq2SPIN = new ARQ2SPIN(model);
		// Ask spinQuery = (Ask) arq2SPIN.createQuery(arqQuery, null);
		//
		// model.write(System.out, FileUtils.langTurtle);

		// String convQuery =
		// "-434a6e44:14aef294cf3:-7d6b <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://spinrdf.org/spin#ConstraintViolation> . ";
		//
		// convQuery = convQuery.replaceAll("[^:\\s]+:[^:\\s]+:[^\\s]+\\s",
		// "_:b0 ");
		// System.out.println(convQuery);

		// String query =
		// "CONSTRUCT { ?x <http://www.w3.org/2002/07/owl#sameAs> ?z . } WHERE { ?x <http://www.w3.org/2002/07/owl#sameAs> ?y . ?y <http://www.w3.org/2002/07/owl#sameAs> ?z . }";
		//
		// System.out.println(new SPIN2Datalog().convert(RuleConverter
		// .genConstruct(query)));

		String bNode = "-325d1c06:14b31fd56b0:-748c";
		// String bNode = "urn:x-hp:eg/ComputingMachine";

		if (!bNode.contains("^^"))
			System.out.println(bNode.replaceAll("^[^:]+:[^:/]+:[^/]+$", "bn"
					+ 0 + ""));
	}

	// this method allows resetting internal state after a conversion request
	// (does not need to be implemented)
	public void reset() {
	}
}
