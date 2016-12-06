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

package wvw.mobibench.service.preproc.ont.binarize;

import java.io.IOException;
import java.util.List;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.Property;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.rdf.model.Statement;

import wvw.mobibench.service.preproc.PreProcessConfig;
import wvw.mobibench.service.preproc.PreProcessConfig.Ontology;
import wvw.mobibench.service.preproc.PreProcessException;
import wvw.mobibench.service.preproc.PreProcessResults;
import wvw.mobibench.service.preproc.PreProcessTypes;
import wvw.mobibench.service.preproc.ont.ChainCollector;
import wvw.mobibench.service.preproc.ont.OntologyBasedPreProcessor;
import wvw.mobibench.service.preproc.ont.RDFRes;
import wvw.mobibench.service.res.ServiceResources;

public class BinarizePreProcessor extends OntologyBasedPreProcessor {

	private int newCtr = 0;
	private int lstCtr = 0;

	public BinarizePreProcessor(ServiceResources res) {
		super(res);
	}

	public PreProcessResults doPreprocess(PreProcessConfig config)
			throws PreProcessException {

		Ontology ontology = config.getOntology();
		try {
			String ontologyStr = normalizeOntology(ontology.getContent(),
					ontology.getSyntax());

			String rulesStr = res.getContents(rootPath + "binary/rules.spin");

			return new PreProcessResults(rulesStr, ontologyStr);

		} catch (IOException e) {
			throw new PreProcessException(e);
		}
	}
	
	public PreProcessTypes getType() {
		return PreProcessTypes.BINARIZE;
	}

	private String normalizeOntology(String ontology, String syntax)
			throws IOException {

		Model m = loadModel(ontology, syntax);

		normalize(RDFRes.intersectionOf, m);
		normalize(RDFRes.propertyChainAxiom, m);
		// has-key not supported

		return getData(m);
	}

	private void normalize(Property p, Model m) {
		List<Statement> stmts = copyStmts(
				m.listStatements(null, p, (RDFNode) null));

		for (Statement stmt : stmts) {
			Resource list = stmt.getObject().asResource();

			List<Resource> chain = ChainCollector.collect(list, m);
			normalize(p, chain, m);
		}
	}

	private void normalize(Property p, List<Resource> chain, Model m) {
		normalize(p, chain, 0, m);
	}

	private void normalize(Property p, List<Resource> chain, int idx, Model m) {
		if (chain.size() - 2 - idx == 0)
			return;

		Resource l1 = chain.get(idx);
		Resource l2 = chain.get(idx + 1);

		Resource nl = m.createResource(
				"http://niche.cs.dal.ca/owl/normalize/L" + lstCtr++);
		Resource ne = m.createResource(
				"http://niche.cs.dal.ca/owl/normalize/N" + newCtr++);

		l1.removeAll(RDFRes.rest);
		l1.addProperty(RDFRes.rest, nl);

		nl.addProperty(RDFRes.first, ne);
		nl.addProperty(RDFRes.rest, RDFRes.nil);

		ne.addProperty(p, l2);

		normalize(p, chain, idx + 1, m);
	}
}
