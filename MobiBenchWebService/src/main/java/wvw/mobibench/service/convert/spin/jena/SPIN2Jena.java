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
package wvw.mobibench.service.convert.spin.jena;

import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.model.Construct;
import org.topbraid.spin.model.TripleTemplate;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.utils.RDFUtils;

public class SPIN2Jena extends SPIN2 {

	private int ctr = 0;

	public SPIN2Jena() {
		super("Jena");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Object> convert(Construct query) throws ConvertException {
		// (instantiate visitor class to visit the parsed query)
		SPIN2JenaVisitor visitor = new SPIN2JenaVisitor(this);

		// 1) Generate rule head using visitor
		query.getWhere().visit(visitor);
		String leftPart = visitor.getLeftPart();

		// 2) Generate rule body
		String rightPart = "";

		// (convert all triple patterns to string format)
		List<TripleTemplate> templates = query.getTemplates();
		for (TripleTemplate template : templates)
			rightPart += "\n(" + RDFUtils.toString(template) + ")";

		// 3) Generate rule
		List<String> rules = new ArrayList<String>();
		
		String rule = "[R" + (ctr++) + ": " + leftPart + "\n" + "->"
				+ rightPart + "\n" + "]";

		// (Jena rule format doesn't allow triangle brackets around datatypes..)
		rule = rule.replaceAll("\\^\\^<([^>]*)>", "^^$1");

		// make sure blank nodes are represented correctly
		rule = RDFUtils.convertBNodes(rule);

		rules.add(rule);
		
		return (List) rules;
	}

	public void reset() {
		super.reset();
		
		ctr = 0;
	}

}
