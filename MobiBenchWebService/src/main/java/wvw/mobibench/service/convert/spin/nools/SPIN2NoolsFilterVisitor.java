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
import java.util.Map;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.nools.NoolsUtils;
import wvw.mobibench.service.visitor.SPINDefaultFilterVisitor;

import com.hp.hpl.jena.rdf.model.RDFNode;

public class SPIN2NoolsFilterVisitor extends SPINDefaultFilterVisitor {

	static {
		primMap.put("eq", "==");
	}

	private Map<String, String> varMap = new HashMap<String, String>();

	public SPIN2NoolsFilterVisitor(Map<String, String> varMap) {
		this.varMap = varMap;
	}

	public String toString(RDFNode node) throws ConvertException {
		return NoolsUtils.nodeToString(node, varMap);
	}
}
