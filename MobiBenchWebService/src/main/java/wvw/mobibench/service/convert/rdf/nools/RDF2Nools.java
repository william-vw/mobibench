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
package wvw.mobibench.service.convert.rdf.nools;

import java.util.HashMap;
import java.util.Map;

import org.topbraid.spin.model.Variable;

import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.RDFNode;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.DataConverter;
import wvw.mobibench.service.convert.nools.NoolsUtils;

public class RDF2Nools extends DataConverter {

	private Map<String, String> varMap = new HashMap<String, String>();

	public RDF2Nools() {
		super("Nools");
	}

	protected String getLineSeparator() {
		return ";\n";
	}
	
	public String convert(RDFNode[] nodes) throws ConvertException {
		try {
			String operands = "";

			for (int i = 0; i < nodes.length; i++) {
				RDFNode node = nodes[i];
				String operand = null;

				if (node instanceof Variable) {
					Variable var = (Variable) node;

					if (!varMap.containsKey(var.toString()))
						throw new ConvertException("Error: invalid variable "
								+ "reference");

					operand = varMap.get(var.toString());

				} else if (node.isURIResource()) {
					String resStr = NoolsUtils.uriToString(node, false);

					if (i == 1)
						operand = "new RDFProperty(" + resStr + ")";
					else
						operand = "new RDFResource(" + resStr + ")";

				} else if (node.isAnon()) {
					String resStr = NoolsUtils.anonToString(node);
					
					operand = "new RDFBlankNode(" + resStr + ")";
										
				} else if (node.isLiteral()) {
					Literal lit = node.asLiteral();
					String litStr = NoolsUtils.litToString(node);

					String dataType = lit.getDatatypeURI();

					operand = "new RDFLiteral("
							+ litStr
							+ ""
							+ (dataType == null ? "" : ", \"" + dataType + "\"")
							+ ")";

				} else
					throw new ConvertException(
							"Error: unsupported RDFNode type");

				if (operands.length() > 0)
					operands += ", ";

				operands += operand;
			}

			return "new RDFStatement(" + operands + ")";

		} catch (Exception e) {
			throw new ConvertException("Error converting N-Triples", e);
		}
	}

	public void setVarMap(Map<String, String> varMap) {
		this.varMap = varMap;
	}

}
