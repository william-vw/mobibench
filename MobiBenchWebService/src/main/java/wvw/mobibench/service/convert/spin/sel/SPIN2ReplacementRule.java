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

package wvw.mobibench.service.convert.spin.sel;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.topbraid.spin.model.Construct;

import wvw.mobibench.service.convert.ConvertConfig;
import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.mobibench.service.select.def.ReplacementRule;
import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.RulesUtils;

public class SPIN2ReplacementRule extends SPIN2 {

	public SPIN2ReplacementRule() {
		super("SPIN2ReplacementRule");
	}

	public Object convertRules(String rulesStr, ConvertConfig config)
			throws ConvertException {

		List<RuleWrapper> rules = RulesUtils.splitRules(rulesStr);

		List<Object> ret = new ArrayList<Object>();
		for (RuleWrapper rule : rules) {
			String comment = rule.getComment();

			int nlIdx = comment.indexOf("\n");

			String id = comment.substring(1, nlIdx).trim();

			int arIdx = comment.indexOf("<==");
			List<String> replaced = Arrays.asList(comment.substring(arIdx + 3).trim()
					.split("(\\s)?,(\\s)?"));

			ret.add(new ReplacementRule(id, replaced, rule.getRule(), rule.getAxioms()));
		}

		return ret;
	}

	public List<Object> convertRules(List<Object> rules) throws ConvertException {
		return null;
	}

	public List<Object> convert(Construct query) throws ConvertException {
		return null;
	}
}
