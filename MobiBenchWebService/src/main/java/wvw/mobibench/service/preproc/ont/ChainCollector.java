package wvw.mobibench.service.preproc.ont;

import java.util.ArrayList;
import java.util.List;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.rdf.model.Statement;
import com.hp.hpl.jena.rdf.model.StmtIterator;

public class ChainCollector {

	public static List<Resource> collect(Resource list, Model m) {
		List<Resource> chain = new ArrayList<Resource>();
		chain.add(list);

		collectChain(list, chain, m);

		return chain;
	}

	private static void collectChain(Resource list, List<Resource> chain, Model m) {
		// Log.d("list: " + list);
		
		StmtIterator stmtIt = m.listStatements(list, RDFRes.rest, (RDFNode) null);
		if (stmtIt.hasNext()) {
			Statement stmt = stmtIt.next();

			Resource list2 = stmt.getObject().asResource();
			if (list2.equals(RDFRes.nil))
				return;

			chain.add(list2);

			collectChain(list2, chain, m);
		}
	}
}
