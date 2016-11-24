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
package wvw.mobibench.service.convert.datalog;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.topbraid.spin.model.TriplePattern;
import org.topbraid.spin.model.TripleTemplate;
import org.topbraid.spin.model.Variable;

import com.hp.hpl.jena.rdf.model.RDFNode;

public class DatalogUtils {

	private static Map<String, String> namespaces = new HashMap<String, String>();

	static {
		// NOTE using ":" separator here results in errors in KrHyper
		namespaces.put("http://www.w3.org/2002/07/owl#", "owl_");
		namespaces.put("http://www.w3.org/2000/01/rdf-schema#", "rdfs_");
		namespaces.put("http://www.w3.org/1999/02/22-rdf-syntax-ns#", "rdf_");
		namespaces.put("http://spinrdf.org/spin#", "spin_");
		namespaces.put("http://spinrdf.org/sp#", "sp_");
		namespaces.put("http://topbraid.org/spin/owlrl#", "owlrl_");
		namespaces.put("http://spinrdf.org/spif#", "spif_");
		namespaces.put("http://www.w3.org/2001/XMLSchema#", "xsd_");
		namespaces.put("http://spinrdf.org/spl#", "spl_");
		namespaces.put("http://niche.cs.dal.ca/owl/", "niche_");
		namespaces.put("http://www.dal.ca/nichegroup/impactaf#", "impactaf_");
		namespaces.put("http://test.com#", "test_");
		namespaces.put("http://swat.cse.lehigh.edu/onto/univ-bench.owl#",
				"univ_");
		namespaces.put("http://www.Department0.University0.edu/", "univ0_");
	}

	public static String toString(TripleTemplate arg0) {
		return toString(new RDFNode[] { arg0.getSubject(), arg0.getPredicate(),
				arg0.getObject() });
	}

	public static String toString(TriplePattern arg0) {
		return toString(new RDFNode[] { arg0.getSubject(), arg0.getPredicate(),
				arg0.getObject() });
	}

	public static String toString(RDFNode[] nodes) {
		return "stmt(" + toString(nodes[0], true) + ","
				+ toString(nodes[1], true) + "," + toString(nodes[2], true)
				+ ")";

		// return toString(nodes[1], false) + "(" + toString(nodes[0], true)
		// + ", " + toString(nodes[2], true) + ")";
	}

	public static String toString(RDFNode node, boolean isArgument) {
		if (node instanceof Variable)
			return node.toString().toUpperCase();
		else
			// IRIS expects string constants to be single quoted
			return (isArgument ? "'" + node.toString() + "'" : node.toString());
	}

	// NOTE for bnode replacement, assumes data is sent in RDF/XML
	// (bnodes are always structured this way in SPIN rules)
	public static String normalizeAll(String str) {
		// for OWL2 RL validation rules (property chain helper)
		str = str.replaceAll("(_:\\d+)", "'$1'");

		Pattern p = Pattern
				.compile("[^\\(,:]+:[^\\(,:/]+:[^\\(,/]+(?=(,|\\)))");
		Matcher m = p.matcher(str);

		int ctr = 0;
		while (m.find()) {
			String bNode = m.group();

			if (!bNode.contains("^^"))
				str = str.replaceAll(bNode, "'bn" + ctr++ + "'");
		}

		str = str.replaceAll("\\^\\^[^\\)']*", "");
		// IRIS doesn't allow numbers to be quoted
		str = str.replaceAll("'(\\d(\\.\\d)*)+'", "$1");

		Iterator<Map.Entry<String, String>> it = namespaces.entrySet()
				.iterator();
		while (it.hasNext()) {
			Map.Entry<String, String> entry = it.next();

			str = str.replaceAll(entry.getKey(), entry.getValue());
		}

		// KRHyper doesn't support ":" in constants
		str = str.replaceAll(":(?!(-|\\d))", "_");
		// IRIS doesn't support "/" in constants
		str = str.replaceAll("/", "_");
		str = str.replaceAll("#", "_");
		str = str.replaceAll(" ", "");

		return str;
	}
}
