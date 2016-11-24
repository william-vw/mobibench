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
package wvw.mobibench.service.convert.nools;

import java.util.Map;

import org.topbraid.spin.model.Variable;

import wvw.mobibench.service.convert.ConvertException;
import wvw.utils.XsdUtils;

import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.RDFNode;

public class NoolsUtils {

	public static String escapeUri(String uri) {
		return uri.replaceAll("/", "\\\\/");
	}

	public static String uriToString(RDFNode node) {
		return uriToString(node, true);
	}
	
	public static String uriToString(RDFNode node, boolean escape) {
		return "\"" + escapeUri(node.toString()) + "\"";
	}
	
	public static String anonToString(RDFNode node) {
		return "\"" + node.toString() + "\"";
	}

	public static String litToString(RDFNode node) {
		Literal lit = (Literal) node;
		
		if (XsdUtils.isNumber(lit))
			return lit.getValue().toString();
		
		else {
			String value = ((Literal) node).getValue().toString();
			value = escapeUri(value);
			
			return "\"" + value + "\"";
		}
	}

	public static String nodeToString(RDFNode node, Map<String, String> varMap)
			throws ConvertException {

		if (node instanceof Variable) {

			if (!varMap.containsKey(node.toString()))
				throw new ConvertException("Error: invalid "
						+ "variable reference (" + node + ")");

			return varMap.get(node.toString()) + ".string";

		} else if (node.isURIResource())
			return uriToString(node);

		else if (node.isAnon())
			return anonToString(node);
			
		else if (node.isLiteral())
			return litToString(node);

		else
			throw new ConvertException("Error: unsupported RDFNode type");
	}
}
