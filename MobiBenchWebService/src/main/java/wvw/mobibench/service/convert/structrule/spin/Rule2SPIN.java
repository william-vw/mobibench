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

package wvw.mobibench.service.convert.structrule.spin;

import java.util.ArrayList;
import java.util.List;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.RuleConverter;
import wvw.mobibench.service.select.domain.rule.struct.Premise;
import wvw.mobibench.service.select.domain.rule.struct.RuleClause;
import wvw.mobibench.service.select.domain.rule.struct.StructuredRule;
import wvw.utils.RDFUtils;

public class Rule2SPIN extends RuleConverter {

	public Rule2SPIN() {
		super("Rule2SPIN");
	}

	public List<Object> convertRule(Object obj) throws ConvertException {
		StructuredRule rule = (StructuredRule) obj;

		StringBuffer query = new StringBuffer().append("CONSTRUCT {\n");

		List<String> triples = conv(rule.getHead());
		for (String triple : triples)
			query.append("\t").append(triple).append(" .\n");
		
		query.append("} WHERE {\n");
		triples = conv(rule.getBody());
		for (String triple : triples)
			query.append("\t").append(triple).append(" .\n");
		
		query.append("}");
		
		List<Object> ret = new ArrayList<Object>();
		ret.add(query.toString());
		
		return ret;
	}

	private List<String> conv(RuleClause rulePart) {
		List<String> triples = new ArrayList<String>();

		for (Premise premise : rulePart.getPremises())
			triples.addAll(conv(premise));

		return triples;
	}

	private List<String> conv(Premise premise) {
		List<String> triples = new ArrayList<String>();

		triples.add(0, RDFUtils.toString(premise.getTriple()));
		
		return triples;
	}
}
