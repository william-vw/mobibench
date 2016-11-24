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

import org.topbraid.spin.model.Variable;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.visitor.SPINDefaultFilterVisitor;
import wvw.utils.RDFUtils;
import wvw.utils.XsdUtils;

import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.RDFNode;

public class SPIN2TriplePatternsFilterVisitor extends SPINDefaultFilterVisitor {

	static {
		primMap.put("eq", "==");
	}

	public String toString(RDFNode node) throws ConvertException {
		if (node instanceof Variable) {
			Variable var = (Variable) node;

			return "bindings." + var.getName() + ".value";
		}

		if (node.isLiteral()) {
			Literal lit = (Literal) node;

			if (XsdUtils.isNumber(lit))
				return lit.getValue().toString();
			else
				return RDFUtils.toString(node, false);

		} else if (node.isURIResource())
			return RDFUtils.toString(node.asResource());

		else
			throw new ConvertException("Error: unsupported RDFNode type");
	}
}
