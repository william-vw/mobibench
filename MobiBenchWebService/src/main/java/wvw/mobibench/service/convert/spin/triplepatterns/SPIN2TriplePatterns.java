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
package wvw.mobibench.service.convert.spin.triplepatterns;

import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.model.Construct;
import org.topbraid.spin.model.TripleTemplate;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.utils.RDFUtils;

public class SPIN2TriplePatterns extends SPIN2 {

	public SPIN2TriplePatterns() {
		super("TriplePatterns");
	}
	
	public SPIN2TriplePatterns(String id) {
		super(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Object> convert(Construct query) throws ConvertException {
		SPIN2TriplePatternsVisitor visitor = new SPIN2TriplePatternsVisitor(this);

		// 1) Generate rule head
		query.getWhere().visit(visitor);
		List<String> leftPart = visitor.getLeftPart();

		// 2) Generate rule body
		List<String> rightPart = new ArrayList<String>();

		List<TripleTemplate> templates = query.getTemplates();
		for (TripleTemplate template : templates)
			rightPart.add("\"" + RDFUtils.toString(template, false, true)
					+ " . \"");

		// 3) Generate rule
		List<String> rules = new ArrayList<String>();
		
		rules.add("{\n" + "\"left\": " + leftPart + ",\n" + "\"right\": "
				+ rightPart + "\n" + "}");
		
		return (List) rules;
	}
}
