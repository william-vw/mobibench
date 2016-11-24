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

package wvw.mobibench.service.convert.spin.structrule;

import java.util.ArrayList;
import java.util.List;

import org.topbraid.spin.model.Filter;
import org.topbraid.spin.model.TriplePattern;
import org.topbraid.spin.model.TripleTemplate;
import org.topbraid.spin.model.Variable;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.SPIN2;
import wvw.mobibench.service.convert.spin.SPIN2Visitor;
import wvw.mobibench.service.select.domain.rule.struct.Premise;
import wvw.mobibench.service.select.domain.rule.struct.RuleClause;
import wvw.mobibench.service.select.domain.rule.struct.StructuredRule;
import wvw.mobibench.service.select.domain.rule.struct.tp.Lit;
import wvw.mobibench.service.select.domain.rule.struct.tp.Res;
import wvw.mobibench.service.select.domain.rule.struct.tp.Term;
import wvw.mobibench.service.select.domain.rule.struct.tp.TriplePat;
import wvw.mobibench.service.select.domain.rule.struct.tp.Var;

import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;

public class SPIN2StructRuleVisitor extends SPIN2Visitor {

	private String id;

	private List<StructuredRule> rules = new ArrayList<StructuredRule>();
	private RuleClause body = new RuleClause();

	public SPIN2StructRuleVisitor(String id, SPIN2 converter) {
		super(converter);

		this.id = id;
	}

	public void visit(Filter arg0) {
		this.exc = new ConvertException("error generating rule body: "
				+ "filters currently not supported");
	}

	public void visit(TriplePattern arg0) {
		Premise premise = convert(arg0.getSubject(), arg0.getPredicate(),
				arg0.getObject());

		if (premise != null)
			body.add(premise);
	}

	public void visit(List<TripleTemplate> templates) {
		RuleClause head = new RuleClause();

		for (TripleTemplate template : templates) {
			Premise premise = convert(template.getSubject(),
					template.getPredicate(), template.getObject());

			if (premise != null)
				head.add(premise);
		}

		done();

		rules.add(new StructuredRule(id, head, body));
	}

	private Premise convert(RDFNode s, RDFNode p, RDFNode o) {
		try {
			Term s2 = convert(s);
			Term p2 = convert(p);
			Term o2 = convert(o);

			return new Premise(new TriplePat(s2, p2, o2));

		} catch (Exception e) {
			this.exc = new ConvertException("error generating rule body", e);
		}

		return null;
	}

	private Term convert(RDFNode node) {
		Term t = null;

		if (node instanceof Variable)
			t = new Var(((Variable) node).getName());

		else if (node.isURIResource())
			t = new Res(((Resource) node).getURI());

		else
			t = new Lit(node.toString());

		return t;
	}

	public void done() {
	}

	private void checkExc() throws ConvertException {
		if (exc != null)
			throw (ConvertException) exc;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Object> getRules() throws ConvertException {
		checkExc();

		return (List) rules;
	}
}
