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
package wvw.utils.rule;

import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.arq.ARQ2SPIN;
import org.topbraid.spin.arq.ARQFactory;
import org.topbraid.spin.model.Construct;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;

import wvw.utils.SplitUtils;

public class RulesUtils {

	public static List<RuleWrapper> splitRules(String rulesStr) {
		String[] rules = SplitUtils.splitOnDoubleNewline(rulesStr);

		List<RuleWrapper> ret = new ArrayList<RuleWrapper>();
		for (String rule : rules) {
			
			if (rule.trim().equals(""))
				continue;
			
			ret.add(new RuleWrapper(rule));
		}

		return ret;
	}

	public static String mergeRules(RuleWrapper orRule, List<Object> rules,
			boolean includeComment) {
		String results = (includeComment && orRule.hasComment()
				? orRule.getComment() + "\n" : "");

		for (Object rule : rules)
			results += rule + "\n\n";

		return results;
	}

	public static String mergeRules(String rules1, String rules2) {
		return rules1 + "\n\n" + rules2;
	}

	public static String mergeRules(List<RuleWrapper> rules) {
		StringBuilder builder = new StringBuilder();

		for (RuleWrapper rule : rules)
			builder.append(rule.getComment()).append("\n")
					.append(rule.getRule().trim()).append("\n\n");

		return builder.toString();
	}

	public static Construct genConstruct(String constructQuery) {
		Model model = ModelFactory.createDefaultModel();
		// statements below have no effect
		// model.setNsPrefix("rdf", RDF.getURI());
		// model.setNsPrefix("impact",
		// "http://www.dal.ca/nichegroup/impactaf#");

		// model.read(new FileReader(Config.path + "res/functions.spin"),
		// "",
		// "N3");

		Query arqQuery = ARQFactory.get().createQuery(model, constructQuery);

		// Query arqQuery = ARQFactory.get().createQuery(constructQuery);

		ARQ2SPIN arq2SPIN = new ARQ2SPIN(model);
		Construct spinQuery = (Construct) arq2SPIN.createQuery(arqQuery, null);

		// testing
		// System.out.println("SPIN query in Turtle:");
		// model.write(System.out, FileUtils.langTurtle);

		// testing
		// Query parsedBack = ARQFactory.get().createQuery(spinQuery);
		// System.out.println("Parsed back:\n" + parsedBack);

		return spinQuery;
	}
}
