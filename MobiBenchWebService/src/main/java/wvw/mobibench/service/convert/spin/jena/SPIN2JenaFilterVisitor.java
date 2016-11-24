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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.topbraid.spin.model.FunctionCall;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.visitor.SPINFilterVisitor;
import wvw.utils.RDFUtils;

import com.hp.hpl.jena.rdf.model.RDFNode;

public class SPIN2JenaFilterVisitor extends SPINFilterVisitor {

	private static Map<String, String> primMap = new HashMap<String, String>();

	static {
		primMap.put("lt", "lessThan");
		primMap.put("le", "le");
		primMap.put("gt", "greaterThan");
		primMap.put("ge", "ge");
		primMap.put("eq", "equal");
		primMap.put("ne", "notEqual");
	}

	public String visit(RDFNode node) throws ConvertException {

		if (node instanceof FunctionCall) {
			FunctionCall fnCall = (FunctionCall) node;
			String fnName = fn(fnCall).getLocalName();

			if (primMap.containsKey(fnName)) {
				fnName = primMap.get(fnName);

				List<RDFNode> args = fnCall.getArguments();
				String argsStr = "";

				for (RDFNode arg : args) {

					if (argsStr.length() > 0)
						argsStr += ",";

					argsStr += visit(arg);
				}
				argsStr = "(" + argsStr + ")";

				return fnName + argsStr;
			}

			else if (fnName.equals("and")) {
				List<RDFNode> args = fnCall.getArguments();

				String str = "";
				for (RDFNode arg : args) {

					if (str.length() > 0)
						str += "\n";

					str += visit(arg);
				}

				return str;

			} else if (fnName.equals("or"))
				throw new ConvertException("Disjunction in FILTER currently not available for Jena (not natively supported by Jena).");

			else if (fnName.equals("not"))
				throw new ConvertException("Negation in FILTER currently not available for Jena (not natively supported by Jena).");
			
			else
				throw new ConvertException("Unsupported function: " + fnName);

		} else {
			String nodeStr = RDFUtils.toString(node);
			// Jena doesn't accept data types in brackets
			nodeStr = nodeStr.replaceAll("\"(.*?)\"\\^\\^<(.*?)>", "\"$1\"^^$2");
			
			return nodeStr;
		}
	}
}
