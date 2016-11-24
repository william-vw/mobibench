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
package wvw.mobibench.service.visitor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.topbraid.spin.model.FunctionCall;

import wvw.mobibench.service.convert.ConvertException;
import wvw.utils.RDFUtils;

import com.hp.hpl.jena.rdf.model.RDFNode;

public class SPINDefaultFilterVisitor extends SPINFilterVisitor {

	protected static Map<String, String> primMap = new HashMap<String, String>();
	protected static Map<String, String> connMap = new HashMap<String, String>();

	static {
		primMap.put("ge", ">=");
		primMap.put("gt", ">");
		primMap.put("eq", "=");
		primMap.put("ne", "!=");
		primMap.put("lt", "<");
		primMap.put("le", "<=");

		connMap.put("and", "&&");
		connMap.put("or", "||");
		connMap.put("not", "!");
	}

	public String visit(RDFNode node) throws ConvertException {

		if (node instanceof FunctionCall) {
			FunctionCall fnCall = (FunctionCall) node;
			String fnName = fn(fnCall).getLocalName();

			if (primMap.containsKey(fnName)) {
				String operator = primMap.get(fnName);
				List<RDFNode> args = fnCall.getArguments();

				return visit(args.get(0)) + " " + operator + " "
						+ visit(args.get(1));
			}

			else if (connMap.containsKey(fnName)) {
				String connector = connMap.get(fnName);
				List<RDFNode> args = fnCall.getArguments();

				String str = "";
				if (connector.equals("!"))
					str = connector + " (" + visit(args.get(0)) + ")";

				else
					for (RDFNode arg : args) {

						if (str.length() > 0)
							str += " " + connector + " ";

						str += visit(arg);
					}

				return "(" + str + ")";

			} else
				throw new ConvertException("Unsupported function: " + fnName);

		} else
			return toString(node);
	}

	public String toString(RDFNode node) throws ConvertException {
		return RDFUtils.toString(node);
	}
}
