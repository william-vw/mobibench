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
package wvw.mobibench.service.convert.spin.sparql;

import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.model.Construct;
import org.topbraid.spin.model.TripleTemplate;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.utils.RDFUtils;

public abstract class SPIN2SPARQL extends SPIN2 {

	protected boolean dataType = true;
	protected boolean doubleEscape = false;

	protected String createClause;

	public SPIN2SPARQL(String id) {
		super(id);
	}

	@SuppressWarnings("unchecked")
	public List<Object> convert(Construct query) throws ConvertException {
		SPIN2SPARQLVisitor visitor = new SPIN2SPARQLVisitor(this, dataType,
				doubleEscape);

		// 1) Generate where clause
		query.getWhere().visit(visitor);
		String whereClause = visitor.getWhereClause();

		// 2) Generate insert clause
		String insertClause = "";

		List<TripleTemplate> templates = query.getTemplates();
		for (TripleTemplate template : templates)
			insertClause += "\n" + RDFUtils.toString(template) + " . ";

		// 3) Generate rule
		List<String> rules = new ArrayList<String>();
		String convQuery = createClause + " { " + insertClause + "\n} WHERE { "
				+ whereClause + " }";

		// make sure blank nodes are represented correctly
		convQuery = RDFUtils.convertBNodes(convQuery);
		// dataytpe issues with RdfOnTheGo (see NOTES.txt)
		convQuery = RDFUtils.normalizeIntDatatypes(convQuery);

		rules.add(convQuery);

		return (List) rules;
	}
}
