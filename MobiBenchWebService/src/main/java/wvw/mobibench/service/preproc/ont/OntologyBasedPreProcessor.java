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

package wvw.mobibench.service.preproc.ont;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Statement;
import com.hp.hpl.jena.rdf.model.StmtIterator;
import com.hp.hpl.jena.reasoner.rulesys.GenericRuleReasoner;
import com.hp.hpl.jena.reasoner.rulesys.Rule;

import wvw.mobibench.service.preproc.PreProcessor;
import wvw.mobibench.service.res.ServiceResources;

public abstract class OntologyBasedPreProcessor extends PreProcessor {

	protected OntologyBasedPreProcessor(ServiceResources res) {
		super(res);
	}

	protected Model loadModel(String data) throws IOException {
		return loadModel(data, "N-TRIPLE");
	}

	protected Model loadModel(String data, String syntax) throws IOException {
		return loadModel(new ByteArrayInputStream(data.getBytes()));
	}

	protected Model loadModel(InputStream in) throws IOException {
		return loadModel(in, "N-TRIPLE");
	}

	protected Model loadModel(InputStream in, String syntax) throws IOException {
		Model m = ModelFactory.createDefaultModel();
		initResources(m);

		m.read(in, "", syntax);

		return m;
	}

	protected Model loadInfModel(String data, String syntax, String rulesStr) throws IOException {
		Model m = loadModel(data, syntax);

		List<Rule> rules = Rule.parseRules(rulesStr);
		GenericRuleReasoner reasoner = new GenericRuleReasoner(rules);

		return ModelFactory.createInfModel(reasoner, m);
	}

	private void initResources(Model m) {
		RDFRes.intersectionOf = m.createProperty("http://www.w3.org/2002/07/owl#intersectionOf");
		RDFRes.propertyChainAxiom = m.createProperty("http://www.w3.org/2002/07/owl#propertyChainAxiom");
		RDFRes.hasKey = m.createProperty("http://www.w3.org/2002/07/owl#hasKey");
		RDFRes.type = m.createProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#type");
		RDFRes.sameAs = m.createProperty("http://www.w3.org/2002/07/owl#sameAs");

		RDFRes.first = m.createProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#first");
		RDFRes.rest = m.createProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#rest");
		RDFRes.nil = m.createProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#nil");

		RDFRes.ne = m.createProperty("http://spinrdf.org/sp#ne");
	}

	protected String getData(Model m) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		m.write(out, "N-TRIPLE");

		return new String(out.toByteArray());
	}

	protected List<Statement> copyStmts(StmtIterator stmtIt) {
		List<Statement> stmts = new ArrayList<Statement>();

		while (stmtIt.hasNext())
			stmts.add(stmtIt.next());

		return stmts;
	}
}
