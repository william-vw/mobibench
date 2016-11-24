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

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import org.topbraid.spin.model.ElementList;
import org.topbraid.spin.model.Filter;
import org.topbraid.spin.model.TriplePattern;
import org.topbraid.spin.model.Variable;

import com.hp.hpl.jena.rdf.model.RDFNode;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.nools.NoolsUtils;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.mobibench.service.convert.spin.SPIN2Visitor;

public class SPIN2NoolsVisitor extends SPIN2Visitor {

	private int stmtCtr = 0;

	private List<Filter> filters = new ArrayList<Filter>();

	// NOTE index on String, since Variable class doesn't seem to override
	// hashCode
	private Map<String, String> varMap = new HashMap<String, String>();

	private String statements = "";

	public SPIN2NoolsVisitor(SPIN2 converter) {
		super(converter);
	}

	public void visit(ElementList arg0) {
		super.visit(arg0);

		processFilters();
	}

	public void visit(Filter arg0) {
		filters.add(arg0);
	}

	public void visit(TriplePattern arg0) {
		try {
			String stmtId = "stmt" + stmtCtr++;
			String stmt = "\t\t" + stmtId + " : RDFStatement";

			String conditions = "";

			RDFNode[] nodes = { arg0.getSubject(), arg0.getPredicate(), arg0.getObject() };
			String[] selectors = { "s", "p", "o" };

			for (int i = 0; i < nodes.length; i++) {
				String condition = null;

				RDFNode node = nodes[i];

				String prefix = stmtId + "." + selectors[i];
				if (node instanceof Variable) {
					Variable var = (Variable) node;

					if (!varMap.containsKey(var.toString()))
						varMap.put(var.toString(), prefix);

					else {
						String varPrefix = varMap.get(var.toString());

						condition = prefix + ".string == " + varPrefix + ".string";
					}

				} else if (node.isURIResource())
					condition = prefix + ".uri == " + NoolsUtils.uriToString(node);

				else if (node.isLiteral())
					condition = prefix + ".value == " + NoolsUtils.litToString(node);

				else {
					exc = new ConvertException("Error: unsupported RDFNode type");

					return;
				}

				if (condition != null) {

					if (conditions.length() > 0)
						conditions += " && ";

					conditions += condition;
				}
			}

			stmt += " " + conditions;

			if (statements.length() > 0)
				statements += ";\n";

			statements += stmt;

		} catch (Exception e) {
			this.exc = new ConvertException("Error generating rule head", e);
		}
	}

	private void processFilters() {
		SPIN2NoolsFilterVisitor filterVisit = new SPIN2NoolsFilterVisitor(varMap);

		try {
			String conditions = "";
			String extraStmts = "";

			for (Filter filter : filters) {
				String condition = filterVisit.visit(filter.getExpression());

				if (conditions.length() > 0)
					conditions += " && ";

				conditions += "(" + condition + ")";
			}

			if (conditions.length() > 0)
				statements += " && " + conditions;

			statements += ";\n";

			if (extraStmts.length() > 0)
				statements += "\n" + extraStmts;

		} catch (Exception e) {
			this.exc = new ConvertException("Error processing functions", e);
		}
	}

	public String getStatements() throws ConvertException {
		if (exc != null)
			throw (ConvertException) exc;

		return statements;
	}

	public Map<String, String> getVarMap() {
		return varMap;
	}

}
