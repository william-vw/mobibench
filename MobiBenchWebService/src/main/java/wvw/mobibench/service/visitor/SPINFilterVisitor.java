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

import java.util.List;

import org.topbraid.spin.model.FunctionCall;

import wvw.mobibench.service.convert.ConvertException;
import wvw.utils.RDFUtils;

import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;

public abstract class SPINFilterVisitor {

	public abstract String visit(RDFNode node) throws ConvertException;

	protected Resource fn(FunctionCall fnCall) {
		return RDFUtils.fn(fnCall);
	}

	protected List<RDFNode> args(FunctionCall fnCall) {
		return RDFUtils.args(fnCall);
	}

	protected List<String> strArgs(FunctionCall fnCall) throws ConvertException {
		return RDFUtils.strArgs(fnCall);
	}

	protected List<String> strArgs(FunctionCall fnCall, boolean dataType) throws ConvertException {
		return RDFUtils.strArgs(fnCall, dataType);
	}

	protected String strListArgs(FunctionCall fnCall) throws ConvertException {
		return RDFUtils.strListArgs(fnCall);
	}

	protected String strListArgs(FunctionCall fnCall, boolean dataType) throws ConvertException {
		return RDFUtils.strListArgs(fnCall, dataType);
	}
}
