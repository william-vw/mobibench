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
package wvw.mobibench.service.convert.rdf.rdfstore_js;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.rdf.baretriples.RDF2BareTriples;

public class RDF2RDFStore_JS extends RDF2BareTriples {

	public RDF2RDFStore_JS() {
		super("RDFStore_JS");
	}

	public String convert(String contents, String syntax)
			throws ConvertException {

		contents = super.convert(contents, syntax);
		contents = replaceBNodes(contents);
		
		return contents;
	}
	
	private String replaceBNodes(String contents) {
		Pattern p = Pattern.compile("_:-.*?:[^\\s]*");
		Matcher m = p.matcher(contents);

		Map<String, Boolean> matches = new HashMap<String, Boolean>();

		while (m.find()) {
			String bNode = m.group();

			matches.put(bNode, true);
		}

		int cnt = 0;
		
		Iterator<String> orBNodes = matches.keySet().iterator();
		while (orBNodes.hasNext()) {
			String orBNode = orBNodes.next();
			String replBNode = "<http://bNode.org/" + cnt++ + ">";
			
			contents = contents.replaceAll(orBNode, replBNode);
		}
		
		return contents;
	}
}
