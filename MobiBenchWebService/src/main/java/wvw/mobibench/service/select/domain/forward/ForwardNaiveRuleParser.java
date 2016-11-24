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

package wvw.mobibench.service.select.domain.forward;

import java.util.List;

import wvw.mobibench.service.convert.ConvertConfig;
import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.rulestr.SPIN2RuleStr;
import wvw.mobibench.service.select.domain.rule.IRule;
import wvw.mobibench.service.select.domain.rule.IRuleParser;
import wvw.mobibench.service.select.domain.rule.IRuleset;
import wvw.mobibench.service.select.domain.rule.RuleParseException;
import wvw.mobibench.service.select.domain.rule.str.RulesetList;
import wvw.utils.log.Logger;

public class ForwardNaiveRuleParser implements IRuleParser {

	private Logger logger = Logger.getLogger();

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public IRuleset parse(String rulesStr) throws RuleParseException {
		try {
			SPIN2RuleStr conv = new SPIN2RuleStr();
			List<IRule> result = (List) conv.convertRules(rulesStr, new ConvertConfig(false));

			return new RulesetList(result);

		} catch (ConvertException e) {
			logger.log(this, e);
		}

		return null;
	}
}
