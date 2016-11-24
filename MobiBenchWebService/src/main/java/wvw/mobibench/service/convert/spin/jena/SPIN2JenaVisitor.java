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

import org.topbraid.spin.model.Filter;
import org.topbraid.spin.model.TriplePattern;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.mobibench.service.convert.spin.SPIN2Visitor;
import wvw.utils.RDFUtils;

public class SPIN2JenaVisitor extends SPIN2Visitor {

	private String leftPart = "";

	public SPIN2JenaVisitor(SPIN2 converter) {
		super(converter);
	}

	public void visit(Filter arg0) {
		SPIN2JenaFilterVisitor filterVisit = new SPIN2JenaFilterVisitor();
		
		try {
			leftPart += "\n" + filterVisit.visit(arg0.getExpression());

		} catch (Exception e) {
			this.exc = new ConvertException("Error generating rule head", e);
		}
	}

	public void visit(TriplePattern arg0) {
		try {
			leftPart += "\n(" + RDFUtils.toString(arg0) + ")";

		} catch (Exception e) {
			this.exc = new ConvertException("Error generating rule head", e);
		}
	}

	public String getLeftPart() throws ConvertException {
		if (exc != null)
			throw (ConvertException) exc;

		return leftPart;
	}
}
