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

import java.util.List;
import java.util.ArrayList;

import org.topbraid.spin.model.Filter;
import org.topbraid.spin.model.TriplePattern;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.mobibench.service.convert.spin.SPIN2Visitor;
import wvw.utils.RDFUtils;

public class SPIN2TriplePatternsVisitor extends SPIN2Visitor {
	
	private List<String> leftPart = new ArrayList<String>();

	public SPIN2TriplePatternsVisitor(SPIN2 converter) {
		super(converter);
	}

	public void visit(Filter arg0) {
		SPIN2TriplePatternsFilterVisitor filterVisit = new SPIN2TriplePatternsFilterVisitor();

		try {
			String cond = filterVisit.visit(arg0.getExpression());
			String filterFn = "function(i, bindings, triples) {\n" + "return (" + cond + ");\n" + "}";

			leftPart.add(filterFn);

		} catch (Exception e) {
			this.exc = new ConvertException("Error generating rule head", e);

			e.printStackTrace();
		}
	}

	public void visit(TriplePattern arg0) {
		try {
			leftPart.add("\"" + RDFUtils.toString(arg0, false, true) + " . \"");

		} catch (Exception e) {
			this.exc = new ConvertException("Error generating rule head", e);

			e.printStackTrace();
		}
	}

	public List<String> getLeftPart() throws ConvertException {
		if (exc != null)
			throw (ConvertException) exc;

		return leftPart;
	}
}
