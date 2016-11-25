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
package wvw.mobibench.service.convert.spin.nools;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.model.Construct;
import org.topbraid.spin.model.TripleTemplate;

import wvw.mobibench.service.convert.ConvertConfig;
import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.rdf.nools.RDF2Nools;
import wvw.mobibench.service.convert.spin.SPIN2;

public class SPIN2Nools extends SPIN2 {

	private int ctr = 0;

	public SPIN2Nools() {
		super("Nools");
	}

	public String convertRules(String rules) throws ConvertException {
		rules = (String) super.convertRules(rules, new ConvertConfig(true, false));

		// Finally, add DSL class definitions
		try {
			String classDefs = res.getContents("res/init.nools");
			return classDefs + "\n\n" + rules;

		} catch (IOException e) {
			throw new ConvertException("Error loading DSL class definitions", e);
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Object> convert(Construct query) throws ConvertException {
		// 1) Generate rule head
		SPIN2NoolsVisitor visitor = new SPIN2NoolsVisitor(this);

		query.getWhere().visit(visitor);
		String leftPart = visitor.getStatements();

		// 2) Generate rule body
		RDF2Nools rdfConv = new RDF2Nools();
		rdfConv.setVarMap(visitor.getVarMap());

		String rightPart = "";

		List<TripleTemplate> templates = query.getTemplates();
		for (TripleTemplate template : templates) {

			String stmt = rdfConv.convert(template);
			stmt = "\t\tassert(" + stmt + ");\n";

			rightPart += stmt;
		}

		// 3) Generate rule
		List<String> rules = new ArrayList<String>();
		rules.add("rule R" + (ctr++) + " {\n" + "\twhen {\n" + leftPart + "\n"
				+ "\t} then {\n" + rightPart + "\n" + "\t}\n" + "}");

		return (List) rules;
	}

	public void reset() {
		super.reset();

		ctr = 0;
	}

}
