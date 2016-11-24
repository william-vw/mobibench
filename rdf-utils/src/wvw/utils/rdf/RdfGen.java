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
package wvw.utils.rdf;

import org.apache.commons.lang3.RandomStringUtils;

import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;

public class RdfGen {

	public static String owlTerm(String localName) {
		return uriTerm(NS.owl + localName);
	}

	public static String rdfTerm(String localName) {
		return uriTerm(NS.rdf + localName);
	}

	public static String rdfsTerm(String localName) {
		return uriTerm(NS.rdfs + localName);
	}

	public static String localTerm(String localName) {
		return uriTerm(NS.local + localName);
	}

	public static String nicheTerm(String localName) {
		return uriTerm(NS.niche + localName);
	}

	public static String owlsTerm(String localName) {
		return uriTerm(NS.owls_process + localName);
	}

	public static String uriTerm(String uri) {
		return "<" + uri + ">";
	}

	public static String literal(String lit) {
		return "\"" + lit + "\"";
	}

	public static String typeTerm() {
		return rdfTerm("type");
	}

	public static String bNode() {
		return "_:" + RandomStringUtils.random(36, true, true);
	}

	public static String bNode(String id) {
		return "_:" + id.replaceAll(":|-", "");
	}

	private static int varCtr = 0;

	public static String var() {
		return "?var" + varCtr++;
	}

	public static String var(String varName) {
		varName = varName.replaceAll("-", "_");

		return "?" + varName;
	}

	public static String nTriple(String s, String p, String o) {
		return s + " " + p + " " + o + " .\n";
	}

	public static String nTriple(Resource s, Resource p, RDFNode o) {
		return toString(s) + " " + toString(p) + " " + toString(o) + " .\n";
	}

	public static String toString(RDFNode n) {
		if (n.isURIResource())
			return "<" + n + ">";

		else if (n.isLiteral())
			return "\"" + n + "\"";

		else
			return n.toString();
	}
}
