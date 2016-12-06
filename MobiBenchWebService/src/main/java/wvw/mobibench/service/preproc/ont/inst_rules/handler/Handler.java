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

package wvw.mobibench.service.preproc.ont.inst_rules.handler;

import java.util.List;

import org.topbraid.spin.arq.ARQ2SPIN;
import org.topbraid.spin.arq.ARQFactory;
import org.topbraid.spin.model.Construct;
import org.topbraid.spin.model.Element;
import org.topbraid.spin.model.TriplePattern;
import org.topbraid.spin.model.TripleTemplate;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.rdf.model.Model;

import wvw.utils.rdf.RdfGen;
import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.build.RuleBuilder;
import wvw.utils.rule.build.SpinRuleBuilder;

public abstract class Handler {

	protected Model m;

	protected RuleWrapper rule;
	protected RuleBuilder ret;

	protected Construct query;

	protected List<TripleTemplate> head;
	protected List<Element> body;

	public String getQuery(RuleWrapper rule, Model m) {
		setup(rule, m);

		return getQuery();
	}

	protected void setup(RuleWrapper rule, Model m) {
		this.rule = rule;
		this.m = m;

		query = toConstruct(rule.getRule(), m);

		head = query.getTemplates();
		body = query.getWhereElements();
	}

	private String getQuery() {
		return "SELECT * WHERE { " + getWhere() + "}";
	}

	protected abstract String getWhere();

	public RuleBuilder instantiate(QuerySolution sol, int idx) {
		setup(sol, idx);

		return doInstantiate(sol, idx);
	}

	protected void setup(QuerySolution sol, int idx) {
		this.ret = toRuleBuilder(rule, idx);
	}

	protected abstract RuleBuilder doInstantiate(QuerySolution sol, int idx);

	protected Construct toConstruct(String constructQuery, Model m) {
		Query arqQuery = ARQFactory.get().createQuery(m, constructQuery);

		ARQ2SPIN arq2SPIN = new ARQ2SPIN(m);
		Construct spinQuery = (Construct) arq2SPIN.createQuery(arqQuery, null);

		return spinQuery;
	}

	protected RuleBuilder toRuleBuilder(RuleWrapper rule, int idx) {
		return new SpinRuleBuilder(rule.getComment().substring(2) + "-" + idx);
	}

	protected String toNTriple(TriplePattern tp) {
		return RdfGen.nTriple(tp.getSubject(), tp.getPredicate(), tp.getObject());
	}
}
