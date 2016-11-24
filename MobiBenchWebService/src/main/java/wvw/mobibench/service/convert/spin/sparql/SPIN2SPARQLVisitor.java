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

import org.topbraid.spin.model.Filter;
import org.topbraid.spin.model.TriplePattern;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.mobibench.service.convert.spin.SPIN2Visitor;
import wvw.mobibench.service.visitor.SPINDefaultFilterVisitor;
import wvw.utils.RDFUtils;

public class SPIN2SPARQLVisitor extends SPIN2Visitor {
	

	protected boolean dataType = true;
	protected boolean doubleEscape = false;
	
	private String whereClause = "";

	public SPIN2SPARQLVisitor(SPIN2 converter, boolean dataType, 
			boolean doubleEscape) {
		
		super(converter);
		
		this.dataType = dataType;
		this.doubleEscape = doubleEscape;
	}

	public void visit(Filter arg0) {
		SPINDefaultFilterVisitor filterVisit = new SPINDefaultFilterVisitor();

		try {
			String cond = filterVisit.visit(arg0.getExpression());
			cond = "FILTER (" + cond + ")";

			whereClause += "\n" + cond;

		} catch (Exception e) {
			this.exc = new ConvertException("Error generating rule head", e);
		}
	}

	public void visit(TriplePattern arg0) {
		try {
			whereClause += "\n" + RDFUtils.toString(arg0, dataType, doubleEscape) + " . ";

		} catch (Exception e) {
			this.exc = new ConvertException("Error generating rule head", e);
		}
	}

	public String getWhereClause() throws ConvertException {
		if (exc != null)
			throw (ConvertException) exc;

		return whereClause;
	}
}