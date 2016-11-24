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
package wvw.utils;

import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.model.FunctionCall;
import org.topbraid.spin.model.TriplePattern;
import org.topbraid.spin.model.TripleTemplate;
import org.topbraid.spin.model.Variable;

import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.select.domain.rule.struct.tp.Lit;
import wvw.mobibench.service.select.domain.rule.struct.tp.Res;
import wvw.mobibench.service.select.domain.rule.struct.tp.Term;
import wvw.mobibench.service.select.domain.rule.struct.tp.TriplePat;
import wvw.mobibench.service.select.domain.rule.struct.tp.Val;
import wvw.mobibench.service.select.domain.rule.struct.tp.Var;
import wvw.utils.rdf.NS;

public class RDFUtils {

	public static Resource fn(FunctionCall fnCall) {
		return fnCall.getFunction();
	}

	public static List<RDFNode> args(FunctionCall fnCall) {
		return fnCall.getArguments();
	}

	public static List<String> strArgs(FunctionCall fnCall)
			throws ConvertException {
		return strArgs(fnCall, true);
	}

	public static List<String> strArgs(FunctionCall fnCall, boolean dataType)
			throws ConvertException {
		return RDFUtils.toString(args(fnCall), dataType);
	}

	public static String strListArgs(FunctionCall fnCall)
			throws ConvertException {
		return strListArgs(fnCall, true);
	}

	public static String strListArgs(FunctionCall fnCall, boolean dataType)
			throws ConvertException {
		return RDFUtils.toListString(strArgs(fnCall, dataType));
	}

	public static String toString(TripleTemplate template)
			throws ConvertException {
		return toString(template, true, false);
	}

	public static String toString(TripleTemplate template, boolean dataType)
			throws ConvertException {
		return toString(template, dataType, false);
	}

	public static String toString(TripleTemplate template, boolean dataType,
			boolean doubleEscape) throws ConvertException {

		return toString(template.getSubject()) + " "
				+ toString(template.getPredicate()) + " "
				+ toString(template.getObject(), dataType, doubleEscape);
	}

	public static String toString(TriplePattern pat) throws ConvertException {
		return toString(pat, true, false);
	}

	public static String toString(TriplePattern pat, boolean dataType)
			throws ConvertException {

		return toString(pat, dataType, false);
	}

	public static String toString(TriplePattern pat, boolean dataType,
			boolean doubleEscape) throws ConvertException {

		return toString(pat, dataType, doubleEscape, null);
	}

	public static String toString(TriplePattern pat, boolean dataType,
			boolean doubleEscape, List<String> vars) throws ConvertException {

		return toString(pat.getSubject(), vars) + " "
				+ toString(pat.getPredicate(), vars) + " "
				+ toString(pat.getObject(), dataType, doubleEscape, vars);
	}

	public static String toString(Resource res, List<String> vars) {
		// variable
		if (res.getURI() == null) {
			if (vars != null)
				vars.add(res.toString());

			return res.toString();
		}

		return "<" + res.getURI() + ">";
	}

	public static String toString(Literal lit, boolean dataType,
			boolean doubleEscape) {

		String str = "\"" + lit.getValue() + "\"";
		if (doubleEscape)
			str = doubleEscape(str);

		if (dataType && lit.getDatatypeURI() != null)
			str += "^^<" + lit.getDatatypeURI() + ">";

		return str;
	}

	public static String toString(TriplePat pat) {
		return toString(pat, true);
	}

	public static String toString(TriplePat pat, boolean doubleEscape) {
		return toString(pat.getSubject()) + " "
				+ toString(pat.getPredicate()) + " "
				+ toString(pat.getObject(), doubleEscape);
	}

	public static String toString(Term term) {
		return toString(term, false);
	}

	public static String toString(Term term, boolean doubleEscape) {
		switch (term.getType()) {

		case VAR:
			return toString((Var) term);

		case VAL:
			Val val = (Val) term;

			switch (val.getValueType()) {

			case LITERAL:
				return toString((Lit) val, doubleEscape);

			case RESOURCE:
				return toString((Res) val);
			}
		}

		return null;
	}

	public static String toString(Var var) {
		return var.toString();
	}

	public static String toString(Lit lit, boolean doubleEscape) {
		String str = "\"" + lit.getStr() + "\"";
		if (doubleEscape)
			str = doubleEscape(str);

		return str;
	}

	public static String toString(Res res) {
		return "<" + res.getUri() + ">";
	}

	public static List<String> toString(List<RDFNode> nodes)
			throws ConvertException {

		return toString(nodes, true);
	}

	public static List<String> toString(List<RDFNode> nodes, boolean dataType)
			throws ConvertException {

		List<String> strs = new ArrayList<String>();

		for (RDFNode node : nodes)
			strs.add(toString(node, dataType));

		return strs;
	}

	public static String toString(RDFNode node) throws ConvertException {
		return toString(node, true, false, null);
	}

	public static String toString(RDFNode node, boolean dataType)
			throws ConvertException {
		return toString(node, dataType, false, null);
	}

	public static String toString(RDFNode node, boolean dataType,
			boolean doubleEscape) throws ConvertException {

		return toString(node, dataType, doubleEscape, null);
	}

	public static String toString(RDFNode node, boolean dataType,
			boolean doubleEscape, List<String> vars) throws ConvertException {

		if (node instanceof Variable) {
			if (vars != null)
				vars.add(node.toString());

			return node.toString();

		} else if (node.isResource())
			return toString(node.asResource(), vars);

		else if (node.isLiteral())
			return toString(node.asLiteral(), dataType, doubleEscape);

		else
			throw new ConvertException("Error: unsupported RDFNode type");
	}

	public static RDFNode[] toRDFNodeArray(TriplePattern triplePattern) {
		return new RDFNode[] { triplePattern.getSubject(),
				triplePattern.getPredicate(), triplePattern.getObject() };
	}

	public static RDFNode[] toRDFNodeArray(TripleTemplate tripleTemplate) {
		return new RDFNode[] { tripleTemplate.getSubject(),
				tripleTemplate.getPredicate(), tripleTemplate.getObject() };
	}

	public static String doubleEscape(String str) {
		return str.replaceAll("\"", "\\\\\"");

	}

	public static String toListString(List<String> nodes) {
		String nodesStr = nodes.toString();

		return "(" + nodesStr.substring(1, nodesStr.length() - 1) + ")";
	}

	public static String toRDF(List<String> triples) {
		String rdf = "";
		for (String triple : triples)
			rdf += triple + "\n";

		return rdf;
	}

	public static String convertBNodes(String str) {
		return str.replaceAll("[^:\\s\\(]+:[^:\\s]+:[^\\s]+\\s", "_:b0 ");
	}

	public static String normalizeIntDatatypes(String str) {
		return str.replaceAll(
				"\\^\\^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger>",
				"^^<http://www.w3.org/2001/XMLSchema#int>");
	}

	public static boolean isTypePred(RDFNode node) {
		return (NS.rdf + "type").equals(node.toString());
	}

	public static boolean isCustomPred(RDFNode node) {
		return !node.toString().startsWith(NS.rdf)
				&& !node.toString().startsWith(NS.rdfs)
				&& !node.toString().startsWith(NS.owl);
	}
}
