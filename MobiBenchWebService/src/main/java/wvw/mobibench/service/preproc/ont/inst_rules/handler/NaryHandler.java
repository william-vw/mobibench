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

import org.topbraid.spin.model.TripleTemplate;

import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.rdf.model.Resource;

import wvw.mobibench.service.preproc.ont.ChainCollector;
import wvw.utils.rdf.RdfGen;

public abstract class NaryHandler extends Handler {

	protected Resource subj;
	protected List<Resource> chain;

	protected TripleTemplate conseq;

	private String subjVar;
	private String propUri;
	private String listVar;

	public NaryHandler(String subjVar, String propUri, String listVar) {
		this.subjVar = subjVar;
		this.propUri = propUri;
		this.listVar = listVar;
	}

	protected void setup(QuerySolution sol, int idx) {
		super.setup(sol, idx);

		this.subj = sol.getResource(subjVar);

		Resource list0 = sol.getResource(listVar);
		this.chain = ChainCollector.collect(list0, m);

		this.conseq = head.get(0);
	}

	protected String getWhere() {
		return RdfGen.nTriple("?" + subjVar, "<" + propUri + ">", "?" + listVar);
	}

}
