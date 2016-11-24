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
package wvw.mobibench.service.convert.rdf.baretriples;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.DataConverter;
import wvw.utils.StreamUtils;

import com.hp.hpl.jena.rdf.model.RDFNode;

public class RDF2BareTriples extends DataConverter {

	public RDF2BareTriples() {
		super("BareTriples");
	}
	
	public RDF2BareTriples(String id) {
		super(id);
	}

	public String convert(String contents, String syntax)
			throws ConvertException {

		if (!syntax.equals("N-TRIPLE"))
			throw new ConvertException("Error: currently, RDF2BareTriples data "
					+ "conversion only supports N-TRIPLE syntax (given: "
					+ syntax + ")");

		return contents.replaceAll("\\^\\^([^\\s\\)]*)", "");
	}

	public String convert(File file, String syntax) throws ConvertException {
		try {
			return convert(StreamUtils.readString(new FileReader(file)), syntax);

		} catch (IOException e) {
			throw new ConvertException("Error converting RDF data to BareTriples",
					e);
		}
	}

	protected String getLineSeparator() {
		return null;
	}

	public String convert(RDFNode[] nodes) throws ConvertException {
		return null;
	}
}
