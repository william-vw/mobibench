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
package wvw.mobibench.service.convert;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.topbraid.spin.model.TriplePattern;
import org.topbraid.spin.model.TripleTemplate;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Statement;
import com.hp.hpl.jena.rdf.model.StmtIterator;

public abstract class DataConverter extends Converter {

	public DataConverter(String id) {
		super(id);
	}

	public String convert(String contents, String syntax)
			throws ConvertException {

		contents = cleanupBNodes(contents);

		return convert(new StringReader(contents), syntax);
	}

	private String cleanupBNodes(String contents) {
		int cnt = 0;

		Pattern p = Pattern.compile("_:-[^:]*:[^\\s]*");
		Matcher m = p.matcher(contents);

		Map<String, Boolean> matches = new HashMap<String, Boolean>();

		while (m.find()) {
			String bNode = m.group();

			matches.put(bNode, true);
		}

		Iterator<String> orBNodes = matches.keySet().iterator();
		while (orBNodes.hasNext()) {
			String orBNode = orBNodes.next();
			String replBNode = "_:bNode" + cnt++;

			contents = contents.replaceAll(orBNode, replBNode);
		}

		return contents;
	}

	public String convert(File file, String syntax) throws ConvertException {
		try {
			return convert(new FileReader(file), syntax);

		} catch (IOException e) {
			throw new ConvertException(
					"Error converting RDF data to " + getId(), e);
		}
	}

	protected String convert(Reader reader, String syntax)
			throws ConvertException {

		String res = "";

		Model model = ModelFactory.createDefaultModel();
		model.read(reader, "", syntax);

		StmtIterator stmtIt = model.listStatements();

		while (stmtIt.hasNext())
			res += convert(stmtIt.next()) + getLineSeparator();

		return res;
	}

	protected String getLineSeparator() {
		return ".\n";
	}

	public String convert(Statement triple) throws ConvertException {
		return convert(new RDFNode[] { triple.getSubject(),
				triple.getPredicate(), triple.getObject() });
	}

	public String convert(TripleTemplate triple) throws ConvertException {
		return convert(new RDFNode[] { triple.getSubject(),
				triple.getPredicate(), triple.getObject() });
	}

	public String convert(TriplePattern triple) throws ConvertException {
		return convert(new RDFNode[] { triple.getSubject(),
				triple.getPredicate(), triple.getObject() });
	}

	public abstract String convert(RDFNode[] nodes) throws ConvertException;
}
