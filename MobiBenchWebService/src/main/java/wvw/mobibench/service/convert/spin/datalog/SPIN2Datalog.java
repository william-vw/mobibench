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
package wvw.mobibench.service.convert.spin.datalog;

import java.util.List;

import org.topbraid.spin.model.Construct;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.datalog.DatalogUtils;
import wvw.mobibench.service.convert.spin.SPIN2;

public class SPIN2Datalog extends SPIN2 {

	public SPIN2Datalog() {
		super("Datalog");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Object> convert(Construct query) throws ConvertException {
		SPIN2DatalogVisitor visitor = new SPIN2DatalogVisitor(this);

		query.getWhere().visit(visitor);
		visitor.visit(query.getTemplates());

		List<Object> rules = (List) visitor.getRules();
		
		return rules;
	}
	
	protected Object postProcessRules(Object rules) {
		return DatalogUtils.normalizeAll(rules.toString());
	}
}
