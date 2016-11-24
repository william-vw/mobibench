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
package wvw.mobibench.service.convert.rdf.datalog;

import java.io.Reader;

import com.hp.hpl.jena.rdf.model.RDFNode;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.DataConverter;
import wvw.mobibench.service.convert.datalog.DatalogUtils;

public class RDF2Datalog extends DataConverter {

	public RDF2Datalog() {
		super("Datalog");
	}
	
	protected String convert(Reader reader, String syntax)
			throws ConvertException {
		
		String res = super.convert(reader, syntax);	
		res = DatalogUtils.normalizeAll(res);
		
		return res;
	}

	protected String getLineSeparator() {
		return ".\n";
	}

	public String convert(RDFNode[] nodes) throws ConvertException {
		return DatalogUtils.toString(nodes);
	}
}
