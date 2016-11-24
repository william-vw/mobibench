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

package wvw.mobibench.service.convert.spin.structrule;

import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.model.Construct;

import wvw.mobibench.service.convert.ConvertConfig;
import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.RulesUtils;

public class SPIN2StructRule extends SPIN2 {

	public SPIN2StructRule() {
		super("SPIN2StructRule");
	}
	
	public Object convertRules(String rulesStr, ConvertConfig config)
			throws ConvertException {
		
		List<RuleWrapper> rules = RulesUtils.splitRules(rulesStr);

		List<Object> ret = new ArrayList<Object>();
		for (RuleWrapper rule : rules) {
			String id = rule.getComment();
			Construct query = genConstruct(rule.getRule());
			
			ret.addAll(convert(id, query));		
		}

		return ret;
	}
	
	public List<Object> convertRules(List<Object> rules) throws ConvertException {
		return null;
	}

	public List<Object> convert(String id, Construct query) throws ConvertException {
		SPIN2StructRuleVisitor visitor = new SPIN2StructRuleVisitor(id, this);

		query.getWhere().visit(visitor);
		visitor.done();

		visitor.visit(query.getTemplates());

		List<Object> rules = visitor.getRules();

		return rules;
	}

	public List<Object> convert(Construct query) throws ConvertException {
		return null;
	}
}
