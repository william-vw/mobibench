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

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import wvw.utils.IOUtils;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;

public class RdfUtils {

	public static void main(String[] args) throws Exception {
		RdfUtils utils = new RdfUtils();

		utils.printRdf();
	}

	@SuppressWarnings("unused")
	private void tripleDiff() throws IOException {
		String[] triples1 = IOUtils
				.readFromFile(
						new File(
								"C:/Users/William/git/mobile-benchmarks/BenchmarkEngineJS/WebContent/res/owl2rl/data/materialized/instances/full/conf_comp.nt"))
				.split("/n");
		String triples2 = IOUtils
				.readFromFile(new File(
						"C:/Users/William/git/mobile-benchmarks/BenchmarkEngineJS/WebContent/res/owl2rl/data/materialized/instances/full/conf.nt"));

		for (String triple1 : triples1) {
			// System.out.println("t1: " + triple1);

			if (!triples2.contains(triple1))
				System.out.println(triple1);
		}
	}

	private void printRdf() throws IOException {
		Model model = ModelFactory.createDefaultModel();

		model.read(
				"file:///C:/Users/William/git/mobile-benchmarks/BenchmarkEngineJS/platforms/android/assets/www/res/owl/data/all/lubm/scale60.owl",
				"", "RDF/XML");

		// model.write(System.out, "N-TRIPLE");

		File out = new File(
				"C:/Users/William/git/mobile-benchmarks/BenchmarkEngineJS/platforms/android/assets/www/res/owl/data/all/lubm/scale60.nt");
		if (!out.exists())
			out.createNewFile();

		FileWriter writer = new FileWriter(out, false);
		model.write(writer, "N-TRIPLE");
	}
}
