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

import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.rdf.model.Resource;

import wvw.mobibench.service.preproc.ont.RDFRes;
import wvw.utils.rdf.RdfGen;
import wvw.utils.rule.build.RuleBuilder;

public class HasKeyHandler extends NaryHandler {

	public HasKeyHandler() {
		super("c", RDFRes.hasKey.getURI(), "l1");
	}

	protected RuleBuilder doInstantiate(QuerySolution sol, int idx) {
		
		
		Resource var1 = conseq.getSubject();
		Resource var2 = (Resource) conseq.getObject();

		String var1Str = var1.toString();
		String var2Str = var2.toString();

		ret.appendTemplate(RdfGen.nTriple(var1, RDFRes.sameAs, var2));

		ret.appendCondition(RdfGen.nTriple(var1, RDFRes.type, subj));
		ret.appendCondition(RdfGen.nTriple(var2, RDFRes.type, subj));

		for (int j = 0; j < chain.size(); j++) {
			Resource list = chain.get(j);
			String curVar = "?z" + j;

			Resource el = list.getPropertyResourceValue(RDFRes.first);

			ret.appendCondition(RdfGen.nTriple(var1Str, "<" + el.getURI() + ">", curVar));
			ret.appendCondition(RdfGen.nTriple(var2Str, "<" + el.getURI() + ">", curVar));
		}

		return ret;
	}
}
