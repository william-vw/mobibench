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
package wvw.mobibench.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.Statement;
import org.apache.jena.rdf.model.StmtIterator;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.formats.TurtleDocumentFormat;
import org.semanticweb.owlapi.model.IRI;
import org.semanticweb.owlapi.model.OWLDocumentFormat;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyManager;

import com.google.common.io.Files;

import wvw.utils.IOUtils;
import wvw.utils.StringUtils;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;
import wvw.utils.map.HashMultiMap;
import wvw.utils.map.MultiMap;
import wvw.utils.rdf.NS;

/**
 * 
 * Some random utils.
 * 
 * 
 * @author wvw
 *
 */

public class BenchmarkUtils {

	private static void init() {
		Log.setTarget(new SystemOutTarget());
	}

	public static void main(String[] args) throws Exception {
		init();

		BenchmarkUtils utils = new BenchmarkUtils();

		// -- collect all services
		// utils.collectAllServices();

		// -- cleanup
		// utils.cleanupIds();

		// -- compare reasoning outputs
		utils.compareOwlOutputs();

		// -- compare different preprocessing strategies
		// utils.comparePreprocessOutputs();

		// -- lists
		// String rootPath =
		// "C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/www/res/owl/data/ore-small/";
		//
		// utils.cntUnivListOcc(rootPath);

		// -- services

		// String rootPath =
		// "C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/www/res/owl/output/service_match/rule_based/androjena/";
		//
		// String selections = "[service-based,entailed]";
		// Log.d("- inferred vs. non-inferred");
		//
		// String[] datasets = { "precond", "effect" };
		// for (String dataset : datasets) {
		// Log.d("> " + dataset);
		//
		// Log.d("\n>> # extra inferences (separate, goal > service): ");
		// utils.extraInferences(rootPath + dataset + "/goal_service.nt",
		// rootPath + dataset + "_schema/goal_service-" + selections
		// + ".nt");
		//
		// Log.d("\n>> # extra inferences (separate, service > goal): ");
		// utils.extraInferences(rootPath + dataset + "/service_goal.nt",
		// rootPath + dataset + "_schema/service_goal-" + selections
		// + ".nt");
		//
		// // Log.d("\n>> # extra inferences (single): ");
		// // utils.extraInferences(rootPath + dataset + "/all_all" +
		// // selections + ".nt",
		// // rootPath + dataset + "_schema/all_all-" + selections + ".nt");
		//
		// Log.d("\n>> # bi-directional (separate, non-inf):");
		// utils.overlapBetweenDirections(
		// rootPath + dataset + "/goal_service.nt",
		// rootPath + dataset + "/service_goal.nt");
		//
		// Log.d("\n>> # bi-directional (separate, inf):");
		// utils.overlapBetweenDirections(
		// rootPath + dataset + "_schema/goal_service-" + selections
		// + ".nt",
		// rootPath + dataset + "_schema/service_goal-" + selections
		// + ".nt");
		//
		// // Log.d("\n>> # bi-directional (single, non-inf):");
		// // utils.overlappingDirections(rootPath + dataset + "/all_all" +
		// // selections + ".nt");
		// //
		// // Log.d("\n>> # bi-directional (single, inf):");
		// // utils.overlappingDirections(
		// // rootPath + dataset + "_schema/all_all-" + selections + ".nt");
		//
		// Log.d("\n");
		// }
		//
		// Log.d("- preconditions vs. effects");
		//
		// Log.d("\n>> matching precond + effect (single, non-inf) ");
		// utils.overlappingPrecondsEffects(rootPath + "precond/all_all" +
		// selections + ".nt",
		// rootPath + "effect/all_all-" + selections + ".nt");
		//
		// Log.d("\n>> matching precond + effect (single, inf) ");
		// utils.overlappingPrecondsEffects(rootPath +
		// "precond_schema/all_all-" + selections + ".nt",
		// rootPath + "effect_schema/all_all-" + selections + ".nt");

		// String rootPath =
		// "C:/Users/William/git/mobile-benchmarks/extract-services/";

		// utils.cmpServiceDescrs(
		// rootPath + "out2/separate/services/target/precond_schema.nt",
		// rootPath + "out4/separate/services/target/precond_schema.nt");

		// String rootPath =
		// "C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/www/res/";
		//
		// utils.countNrStmts(new File(rootPath + "owl/data/ore-small/"));

		// utils.countDistinctTerms(
		// new File(rootPath + "out4/single/target/precond.nt"),
		// new File(rootPath + "out4/single/target/effect.nt"));

		// utils.countServiceSizes(
		// new File(rootPath + "out4/single/target/precond.nt"),
		// new File(rootPath + "out4/single/target/effect.nt"));

		// utils.countServiceSizes(
		// new File(rootPath + "out4/single/target/precond_schema.nt"),
		// new File(rootPath + "out4/single/target/effect_schema.nt"));

		// -- extract test cases from owl2rl test suite

		// utils.convertOWLTestSuite();
		// utils.extractOWL2RLTestSuite();
	}

	private Map<String, String> namespaces = new HashMap<String, String>();

	public BenchmarkUtils() {
		namespaces.put("rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#");
		namespaces.put("spin", "http://spinrdf.org/spin#");
		namespaces.put("sp", "http://spinrdf.org/sp#");
		namespaces.put("owlrl", "http://topbraid.org/spin/owlrl#");
		namespaces.put("owl", "http://www.w3.org/2002/07/owl#");
		namespaces.put("spif", "http://spinrdf.org/spif#");
		namespaces.put("xsd", "http://www.w3.org/2001/XMLSchema#");
		namespaces.put("list", "http://jena.hpl.hp.com/ARQ/list#");
		namespaces.put("rdfs", "http://www.w3.org/2000/01/rdf-schema#");
		namespaces.put("spl", "http://spinrdf.org/spl#");
	}

	// > construct "all.nt" for all service conditions
	public void collectAllServices() throws IOException {
		File f = new File("C:/Users/William/git/mobile-benchmarks/" + "MobiBenchEngineJS/www/res/services/all.nt");

		String contents = IOUtils.readFromFile(f);

		contents = contents.replaceAll("(\n\n)?# [^\n]+", "");
		Log.d(contents);
	}

	// > prepare SPIN OWL2 RL ruleset for benchmarking

	// IMPORTANT manually remove functions & unsupported rules after conversion
	// IMPORTANT manually collect functions from owl2rl.owl & copy to
	// functions.spin (SPIN WebService)

	public void convertSpinRules() throws Exception {
		String path = "C:/Users/William/git/mobile-benchmarks/BenchmarkEngineJS/WebContent/res/rules/owl2rl/";

		String owl2rl = IOUtils.readFromFile(new File(path + "owl2rl.owl"));

		String spinRules = extractSpinRules(owl2rl);
		spinRules = resolveNamespaces(spinRules);
		// spinRules = replaceBNodes(spinRules);

		System.out.println(spinRules);

		IOUtils.writeToFile(spinRules, new File(path + "owl2rl.spin-rules"));
	}

	private String extractSpinRules(String owl2rl) throws Exception {
		StringBuilder str = new StringBuilder();

		int stIdx = owl2rl.indexOf(">#");
		int edIdx = owl2rl.indexOf("</sp:text>", stIdx);

		while (stIdx != -1) {
			String spinRule = owl2rl.substring(stIdx + 1, edIdx);
			str.append(spinRule).append("\n").append("\n");

			stIdx = owl2rl.indexOf(">#", edIdx);
			edIdx = owl2rl.indexOf("</sp:text>", stIdx);
		}

		return str.toString();
	}

	private String resolveNamespaces(String rdf) throws Exception {
		Iterator<String> it = namespaces.keySet().iterator();
		while (it.hasNext()) {
			String prefix = it.next();
			String url = namespaces.get(prefix);

			rdf = rdf.replaceAll(prefix + ":([^\\s\"\\(]*)", "<" + url + "$1>");
		}

		return rdf;
	}

	// > prepare OWL2 RL Corpus ontologies for benchmarking

	public void extractConvertORE(String path, String to, String... froms) throws Exception {
		String targetFolder = path + to;

		long maxLength = 750 * 1024;
		for (String from : froms) {
			File target = new File(targetFolder + "/" + from);
			target.mkdir();

			File[] files = new File(path + from).listFiles();
			for (File src : files) {
				System.out.println("\nsrc: " + src);

				if (src.isDirectory())
					continue;

				long size = src.length();
				if (size <= maxLength) {
					System.out.println("extract: " + src.getName() + " (#" + size + ")");

					String destPath = path + to + "/" + from + "/" + src.getName();
					destPath = destPath.substring(0, destPath.lastIndexOf(".") + 1) + "nt";

					File dest = new File(destPath);
					convertToTurtle(src, dest);

					try {
						Model m = ModelFactory.createDefaultModel();
						m.read(new FileInputStream(destPath), "", "TURTLE");

						long nrStmts = m.size();
						System.out.println("nrStmts: " + nrStmts);

						if (nrStmts < 5000)
							m.write(new FileOutputStream(destPath), "N-TRIPLE");

						else {
							if (!dest.delete())
								System.out.println("error deleting (0)");
						}

					} catch (Exception e) {
						e.printStackTrace();

						if (!dest.delete())
							System.out.println("error deleting (1)");
					}
				}
			}
		}
	}

	// courtesy of
	// http://stackoverflow.com/questions/23210252/save-ontology-file-owl-api
	private void convertToTurtle(File srcFile, File dest) throws Exception {
		OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
		OWLOntology ontology = manager.loadOntologyFromOntologyDocument(srcFile);

		OWLDocumentFormat srcFormat = manager.getOntologyFormat(ontology);

		System.out.println("saving to: " + dest);
		if (dest.exists())
			dest.delete();

		TurtleDocumentFormat destFormat = new TurtleDocumentFormat();
		if (srcFormat.isPrefixOWLOntologyFormat())
			destFormat.copyPrefixesFrom(srcFormat.asPrefixOWLOntologyFormat());

		manager.saveOntology(ontology, destFormat, IRI.create(dest.toURI()));
	}

	public void bulkCategorizeORE(File folder, String... froms) throws IOException {
		StringBuffer maps = new StringBuffer();

		File parent = new File(folder, "ore");
		parent.mkdir();

		long smallLimit = 500;
		File smallFolder = new File(parent, "ore-small");
		smallFolder.mkdir();

		long mediumLimit = 1000;
		File mediumFolder = new File(parent, "ore_medium");
		mediumFolder.mkdir();

		long largeLimit = 2000;
		File largeFolder = new File(parent, "ore_large");
		largeFolder.mkdir();

		long veryLargeLimit = 3000;
		File veryLargeFolder = new File(parent, "ore_very-large");
		veryLargeFolder.mkdir();

		int smallCnt = 0, mediumCnt = 0, largeCnt = 0, veryLargeCnt = 0;
		for (String from : froms) {
			File dir = new File(folder, from);

			File[] files = dir.listFiles();
			for (File file : files) {
				String oldName = from + "/" + file.getName();

				System.out.println("file: " + file);

				Model m = ModelFactory.createDefaultModel();
				m.read(new FileInputStream(file), "", "N-TRIPLE");

				String newName = null;

				long nrStmts = m.size();
				System.out.println("src: " + oldName + " (# " + nrStmts + ")");

				if (nrStmts <= smallLimit)
					newName = "ore/" + smallFolder.getName() + "/" + smallCnt++ + ".nt";

				else if (nrStmts <= mediumLimit)
					newName = "ore/" + mediumFolder.getName() + "/" + mediumCnt++ + ".nt";

				else if (nrStmts <= largeLimit)
					newName = "ore/" + largeFolder.getName() + "/" + largeCnt++ + ".nt";

				else if (nrStmts <= veryLargeLimit)
					newName = "ore/" + veryLargeFolder.getName() + "/" + veryLargeCnt++ + ".nt";

				if (newName != null) {
					maps.append(oldName).append(" => ").append(newName).append("\n");

					File dest = new File(folder, newName);
					System.out.println("target: " + newName);

					Files.copy(file, dest);
				}

				System.out.println();
			}
		}

		File mapFile = new File(folder + "/ore", "map.txt");

		FileOutputStream fos = new FileOutputStream(mapFile, false);
		fos.write(maps.toString().getBytes());

		fos.close();
	}

	public void bulkReplaceBNodes(File folder) throws IOException {
		File[] files = folder.listFiles();

		for (int i = 0; i < files.length; i++) {
			File file = files[i];

			String rdf = IOUtils.readFromFile(file);
			rdf = replaceBNodes(rdf, i);

			IOUtils.writeToFile(rdf, file, false);
		}
	}

	public void bulkConvert(File folder) throws IOException {
		File[] files = folder.listFiles();
		for (File file : files) {

			if (file.getName().endsWith(".nt")) {
				System.out.println("converting: " + file.getName());

				Model m = ModelFactory.createDefaultModel();
				m.read(new FileInputStream(file), "", "TURTLE");

				m.write(new FileOutputStream(file, false), "N-TRIPLE");
			}
		}
	}

	// > prepare OWL2 RL Test Suite for conformance testing

	public void convertOWLTestSuite() throws Exception {
		File srcFolder = new File(
				"C:/Users/William/git/mobile-benchmarks/test-data/testsuite-owl2-rdfbased/subsuites/owl2rl/");

		String[] testCases = IOUtils.readFromFile(new File(srcFolder, "rules.txt")).split("\n");

		for (String testCase : testCases) {
			File caseFolder = new File(srcFolder, testCase);

			List<File> files = new ArrayList<File>();
			List<String> postFixes = new ArrayList<String>();

			File premiseFile = new File(caseFolder, testCase + ".premisegraph.ttl");
			if (premiseFile.exists()) {
				File conclusionFile = new File(caseFolder, testCase + ".conclusiongraph.ttl");

				files.add(premiseFile);
				postFixes.add(".premisegraph");

				files.add(conclusionFile);
				postFixes.add(".conclusiongraph");

			} else {
				files.add(new File(caseFolder, testCase + ".graph.ttl"));

				postFixes.add(".graph");
			}

			for (int i = 0; i < files.size(); i++) {
				File file = files.get(i);
				String postFix = postFixes.get(i);

				Model model = ModelFactory.createDefaultModel();
				model.read(new FileInputStream(file), "", "TURTLE");

				File ntFile = new File(caseFolder, testCase + postFix + ".nt");
				model.write(new FileOutputStream(ntFile), "N-TRIPLE");

				model.close();

				System.out.println("written: " + ntFile.getAbsolutePath());
			}
		}
	}

	public void extractOWL2RLTestSuite() throws Exception {
		String srcPath = "C:/Users/William/git/mobile-benchmarks/test-data/testsuite-owl2-rdfbased/subsuites/owl2rl/";

		String[] allTestCases = IOUtils.readFromFile(new File(srcPath + "rules.txt")).split("\n");

		String schemaTestCases = IOUtils.readFromFile(new File(srcPath + "rules-inf-schema.txt"));

		Map<String, String> ruleMap = new HashMap<String, String>();

		String[] rules = IOUtils
				.readFromFile(new File(
						"C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/www/res/owl/owl2rl/full/rules.spin"))
				.split("\n\n#");

		for (String rule : rules) {
			String name = "# " + rule.substring(0, rule.indexOf("\n")).trim();
			String conseq = rule.substring(rule.indexOf("{") + 2, rule.indexOf("}")).replaceAll("\t", "")
					.replaceAll("    ", "").replaceAll(" a ", " <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ")
					.replaceAll("\n\n", "");

			ruleMap.put(name, conseq);
		}

		Map<String, String> consistMap = new HashMap<String, String>();
		MultiMap<String, String> rootsConsistMap = new HashMultiMap<String, String>();
		MultiMap<String, String> pathsConsistMap = new HashMultiMap<String, String>();

		String[] consistTestCases = IOUtils.readFromFile(new File(srcPath + "rules-consist.txt")).split("\n");

		for (String testCase : consistTestCases) {
			String[] parts = testCase.split(": ");

			String name = parts[0];

			String[] inst = parts[1].split(";");
			String rule = inst[0];

			consistMap.put(name, rule);

			String[] roots = inst[1].split(",");

			for (String root : roots)
				rootsConsistMap.putEl(name, root);

			if (inst.length > 2) {
				String[] paths = inst[2].split(",");

				for (String path : paths)
					pathsConsistMap.putEl(name, path);
			}
		}

		File targetFolder = new File("C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/www/res/owl/data/tmp/");
		targetFolder.mkdirs();

		File allInFile = new File(targetFolder, "conf_in.nt");
		allInFile.createNewFile();

		OutputStream allInStrm = new FileOutputStream(allInFile, false);

		File allOutFile = new File(targetFolder, "conf_out.nt");
		allOutFile.createNewFile();

		OutputStream allOutStrm = new FileOutputStream(allOutFile, false);

		File schemaInfFolder = new File(targetFolder, "inf/schema/");
		schemaInfFolder.mkdirs();

		File schemaInfInFile = new File(schemaInfFolder, "conf_in.nt");
		schemaInfInFile.createNewFile();

		OutputStream schemaInfInStrm = new FileOutputStream(schemaInfInFile, false);

		File schemaInfOutFile = new File(schemaInfFolder, "conf_out.nt");
		schemaInfOutFile.createNewFile();

		OutputStream schemaInfOutStrm = new FileOutputStream(schemaInfOutFile, false);

		for (int i = 0; i < allTestCases.length; i++) {
			int idx = i + 1;

			String testCase = allTestCases[i].trim();
			Log.d(idx + ": " + testCase);

			File caseFolder = new File(srcPath + testCase);

			File premiseFile = new File(caseFolder, testCase + ".premisegraph.nt");

			if (premiseFile.exists()) {

				File conclusionFile = new File(caseFolder, testCase + ".conclusiongraph.nt");

				Model premise = ModelFactory.createDefaultModel();
				premise.read(readRdf(premiseFile, idx), "", "N-TRIPLE");

				Model conclusion = ModelFactory.createDefaultModel();
				conclusion.read(readRdf(conclusionFile, idx), "", "N-TRIPLE");

				refactor(idx, premise, conclusion);

				if (schemaTestCases.contains(testCase)) {
					premise.write(schemaInfInStrm, "N-TRIPLE");

					conclusion.write(schemaInfOutStrm, "N-TRIPLE");
				}

				premise.write(allInStrm, "N-TRIPLE");
				conclusion.write(allOutStrm, "N-TRIPLE");

			} else {
				String rule = consistMap.get(testCase);
				List<String> roots = rootsConsistMap.get(testCase);
				List<String> paths = pathsConsistMap.get(testCase);

				if (rule == null) {
					Log.e("ERROR: no consistency rule found for" + testCase);

					continue;
				}

				File consistencyFile = new File(caseFolder, testCase + ".graph.ttl");

				Model premise = ModelFactory.createDefaultModel();
				premise.read(readRdf(consistencyFile, "TURTLE", "N-TRIPLE", idx), "", "N-TRIPLE");

				refactor(idx, premise);

				premise.write(allInStrm, "N-TRIPLE");

				String conseq = ruleMap.get(rule);
				for (String root : roots) {
					String conseq2 = conseq.replaceAll("(\\?x|\\?y1|\\?i|\\?i1)", root);

					if (paths != null) {
						for (String path : paths) {
							String conseq3 = conseq2.replace("?p", path);

							allOutStrm.write(conseq3.getBytes());
						}

					} else {
						allOutStrm.write(conseq2.getBytes());
					}
				}
			}
		}

		schemaInfInStrm.close();
		schemaInfOutStrm.close();

		allInStrm.close();
		allOutStrm.close();
	}

	private void refactor(int idx, Model... models) {
		for (Model model : models) {
			List<Statement> newStmts = new ArrayList<Statement>();

			StmtIterator stmtIt = model.listStatements();
			while (stmtIt.hasNext()) {
				Statement stmt = stmtIt.next();

				RDFNode[] nodes = new RDFNode[] { stmt.getSubject(), stmt.getPredicate(), stmt.getObject() };

				boolean changed = false;
				for (int i = 0; i < nodes.length; i++) {
					RDFNode node = nodes[i];

					if (node.toString().startsWith("http://www.example.org#")) {
						changed = true;

						String newUri = node.toString() + "_" + idx;
						if (i == 1)
							nodes[i] = model.createProperty(newUri);
						else
							nodes[i] = model.createResource(newUri);
					}
				}

				if (changed) {
					stmtIt.remove();

					newStmts.add(model.createStatement((Resource) nodes[0], (Property) nodes[1], nodes[2]));
				}
			}

			for (Statement newStmt : newStmts)
				model.add(newStmt);
		}
	}

	private InputStream readRdf(File file, int idx) throws IOException {
		String rdf = IOUtils.readFromFile(file);
		rdf = replaceBNodes(rdf, idx);

		return StringUtils.toStream(rdf);
	}

	private InputStream readRdf(File file, String inFormat, String outFormat, int idx) throws IOException {

		Model model = ModelFactory.createDefaultModel();

		model.read(new FileInputStream(file), "", inFormat);

		ByteArrayOutputStream bOut = new ByteArrayOutputStream();
		model.write(bOut, outFormat);

		String ret = new String(bOut.toByteArray());
		ret = replaceBNodes(ret, idx);

		return StringUtils.toStream(ret);
	}

	private String replaceBNodes(String rdf, int idx) {
		Pattern p = Pattern.compile("_:[^\\s]+");
		Matcher m = p.matcher(rdf);

		int ctr = 0;
		while (m.find())
			rdf = rdf.replaceAll(m.group(0), "<" + NS.niche + "bNode_" + ctr++ + "_" + idx + ">");

		return rdf;
	}

	// > benchmark help functions

	// - count # universally-quantified LISTS
	public void cntUnivListOcc(String folder) throws IOException {
		int maxListSize = 0;
		List<Integer> allListSizes = new ArrayList<Integer>();

		int nrIntersFiles = 0;
		int totalNrInters = 0;

		File[] files = new File(folder).listFiles();
		for (File file : files) {

			if (file.isDirectory())
				continue;

			String contents = IOUtils.readFromFile(file);

			// NOTE propertyChainAxiom, hasKey not in ORE dataset
			int nr = org.apache.commons.lang3.StringUtils.countMatches(contents,
					"<http://www.w3.org/2002/07/owl#intersectionOf>");

			if (nr > 0) {
				Log.d("file: " + file.getName());
				Log.d(nr + " intersections");
				nrIntersFiles++;

				List<Integer> sizes = getListSizes(contents);
				Log.d("sizes: " + sizes);

				for (int size : sizes) {

					if (size > maxListSize)
						maxListSize = size;
				}

				allListSizes.addAll(sizes);
			}

			totalNrInters += nr;
		}

		Log.d("");

		Log.d("total # intersections: " + totalNrInters);
		Log.d("# files with intersections: " + nrIntersFiles);
		Log.d("max list size: " + maxListSize);
		Log.d("found list sizes: " + allListSizes);
	}

	private List<Integer> getListSizes(String contents) {
		List<Integer> sizes = new ArrayList<Integer>();

		Model m = ModelFactory.createDefaultModel();
		m.read(new ByteArrayInputStream(contents.getBytes()), "", "N-TRIPLE");

		StmtIterator stmtIt = m.listStatements(null, m.createProperty("http://www.w3.org/2002/07/owl#intersectionOf"),
				(RDFNode) null);

		while (stmtIt.hasNext()) {
			Statement stmt = stmtIt.next();

			Resource list = stmt.getObject().asResource();
			sizes.add(getListSize(list, m, 0));
		}

		return sizes;
	}

	private int getListSize(Resource list, Model m, int cnt) {
		// Log.d("list: " + list);

		StmtIterator stmtIt = m.listStatements(list,
				m.createProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#rest"), (RDFNode) null);

		if (stmtIt.hasNext()) {
			Statement stmt = stmtIt.next();
			Resource list2 = stmt.getObject().asResource();

			return getListSize(list2, m, cnt + 1);
		}

		return cnt;
	}

	// - compare service match results

	public void extraInferences(String subPathDir, String superPathDir) throws IOException {

		MultiMap<String, String> subSet = collectSet(subPathDir, "non-inf");
		MultiMap<String, String> superSet = collectSet(superPathDir, "inf");

		Iterator<String> it1 = superSet.keySet().iterator();
		while (it1.hasNext()) {
			String descr1 = it1.next();
			List<String> descrs1 = superSet.get(descr1);

			if (!subSet.containsKey(descr1)) {

				for (String descr1m : descrs1)
					Log.d("(0) extra inf: " + descr1 + " > " + descr1m);

			} else {
				List<String> descrs2 = subSet.get(descr1);

				for (String descr1m : descrs1) {
					if (!descrs2.contains(descr1m)) {

						Log.d("(1) extra inf: " + descr1 + " > " + descr1m);
					}
				}
			}
		}

		Log.d("");
	}

	public void overlapBetweenDirections(String gsPathDir, String sgPathDir) throws IOException {

		MultiMap<String, String> gsSet = collectSet(gsPathDir, "goal-service");
		MultiMap<String, String> sgSet = collectSet(sgPathDir, "service-goal");

		cmpOverlaps(sgSet, gsSet, "bi-dir");
	}

	public void overlappingDirections(String pathDir) throws IOException {
		MultiMap<String, String> set = collectSet(pathDir, "all");

		cmpOverlaps(set, set, "bi-dir");
	}

	public void overlappingPrecondsEffects(String pPathDir, String ePathDir) throws IOException {

		MultiMap<String, String> pSet = collectSet(pPathDir, "preconds");
		MultiMap<String, String> eSet = collectSet(ePathDir, "effects");

		cmpOverlaps(pSet, eSet, "precond + effect");
	}

	private void cmpOverlaps(MultiMap<String, String> set1, MultiMap<String, String> set2, String prefix) {

		int biDirCnt = 0;
		// int oneDirCnt = 0;

		Iterator<String> it = set1.keySet().iterator();
		while (it.hasNext()) {
			String descr = it.next();

			List<String> descrs = set1.get(descr);
			for (String descr2 : descrs) {

				if (set2.containsKey(descr2)) {
					List<String> descrs2 = set2.get(descr2);

					if (descrs2.contains(descr)) {
						biDirCnt++;

						Log.d(prefix + ": " + descr + ", " + descr2);

					}
					// else oneDirCnt++;

				}
				// else oneDirCnt++;
			}
		}

		Log.d("# " + prefix + ": " + biDirCnt);
		// Log.d("# one-dir: " + oneDirCnt);

		Log.d("");
	}

	private MultiMap<String, String> collectSet(String path, String prefix) throws IOException {

		int cnt = 0;

		MultiMap<String, String> map = new HashMultiMap<String, String>();
		BufferedReader reader = new BufferedReader(new FileReader(new File(path)));

		String line = null;
		while ((line = reader.readLine()) != null) {

			if (line.startsWith("id: ")) {
				String id = line.substring("id: ".length());
				int sepIdx = id.indexOf(">");

				String source = id.substring(0, sepIdx);
				String target = id.substring(sepIdx + 1);

				if (!source.equals(target)) {
					cnt++;

					map.putEl(source, target);
				}
			}
		}

		reader.close();

		Log.d(prefix + ": #" + cnt);

		return map;
	}

	// - compare descriptions of the same service but in different files
	public void cmpServiceDescrs(String path1, String path2) {
		// ..
	}

	// - compare number of statements in inference outputs
	public void cmpOutputs(String smaller, String larger) throws IOException {
		int cnt = 0;
		int totalDiff = 0;

		File folder = new File("C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/WebContent/res/owl/output/"
				+ "ontology_inference/owl2rl/ore-small/");

		File[] subs = folder.listFiles();
		for (File sub : subs) {

			File f1 = new File(sub, smaller);
			File f2 = new File(sub, larger);

			int c1 = cntNrStmts(f1);
			int c2 = cntNrStmts(f2);

			if (c1 < c2) {
				System.out.println("smaller: " + sub.getName() + " (" + c1 + " < " + c2 + ")");

				totalDiff += (c2 - c1);

				cnt++;

			} else if (c1 > c2)
				System.err.println("ding dong! " + sub.getName());
			// else
			// System.out.println("same size");
		}

		System.out.println("smaller: " + cnt + " / 189");
		System.out.println("totalDiff: " + totalDiff + " (avg: " + (totalDiff / 188) + ")");
	}

	private int cntNrStmts(File f) throws IOException {
		int cnt = 0;
		BufferedReader br = new BufferedReader(new FileReader(f));

		while (br.readLine() != null)
			cnt++;

		br.close();

		return cnt;
	}

	public void cntNrStmts(File folder, String predicate) throws IOException {
		File[] files = folder.listFiles();

		int cnt = 0;
		int other = 0;
		int total = 0;

		for (File file : files) {

			if (file.isDirectory())
				continue;

			BufferedReader br = new BufferedReader(new FileReader(file));

			String line = null;
			while ((line = br.readLine()) != null) {
				if (line.contains(predicate))
					cnt++;
				else
					other++;

				total++;
			}

			br.close();
		}

		System.out.println("cnt: " + cnt + "\nother: " + other + "\ntotal: " + total);
	}

	// - check which files are missing in performance-outputs folder
	// (i.e., which are suffixed sequentially)
	public void checkMissingFiles(File folder, String discr, boolean pos, int limit) throws IOException {

		File[] files = folder.listFiles();

		List<Integer> nrs = new ArrayList<Integer>();
		for (File file : files) {
			String name = file.getName();
			if (!name.endsWith(".txt") || name.startsWith("log")
					|| ((pos && !name.contains(discr) || (!pos && name.contains(discr)))))

				continue;

			int nr = Integer.parseInt(name.substring(name.lastIndexOf("_") + 1, name.length() - 4));

			nrs.add(nr);
		}

		Collections.sort(nrs);
		// System.out.println(nrs);

		int cnt = 0;
		for (int i = 0; i < nrs.size(); i++) {
			int nr = nrs.get(i);

			if (nr != cnt++) {
				System.err.println("not found: " + (nr - 1));

				cnt++;
			}

			if (i == nrs.size() - 1) {
				if (nr != limit) {

					System.err.println("missing from: " + nr);
				}
			}
		}
	}

	// - make sure only schema inferences are missing
	private Pattern p = Pattern.compile("<.*?> <.*?> <.*?> \\.");

	public void checkSchemaInferences(File file) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(file));

		int cnt = 0;
		boolean missing = false;

		String line = null;
		while ((line = br.readLine()) != null) {

			if (line.startsWith("missing inferences:"))
				missing = true;

			else if (missing) {

				if (line.equals("")) {
					missing = false;

					// @formatter:off
				} else if (line.startsWith("<") && 
					!(line.contains(" <http://www.w3.org/2000/01/rdf-schema#subClassOf> ") ||
						line.contains(" <http://www.w3.org/2002/07/owl#equivalentClass> ") ||
						line.contains(" <http://www.w3.org/2000/01/rdf-schema#domain> ") || 
						line.contains(" <http://www.w3.org/2000/01/rdf-schema#range> "))) {
				// @formatter:on

					if (p.matcher(line).matches())
						System.out.println("ding dong: " + line);

				} else
					cnt++;
			}
		}

		System.out.println("# ignored: " + cnt);

		br.close();
	}

	// - compare contents of different rule- and axiom-sets
	public void compareRulesetsAxioms() throws IOException {
		String folder = "C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/WebContent/res/owl/owl2rl/";

		String path1 = folder + "inferences/all/red4/";
		String path2 = folder + "inferences/instances/red4/";

		String path3 = folder + "inferences/ontology/red4/";
		// String path3 = null;

		System.out.println("-- rules:");
		compareRulesets(path1, path2, path3);

		System.out.println("\n\n-- axioms:");
		compareAxioms(path1, path2, path3);
	}

	private void compareRulesets(String path1, String path2, String path3) throws IOException {
		Pattern p = Pattern.compile("# ([^\\(\\n]*)"); // rules

		compareSets(p, path1 + "rules.spin", path2 + "rules.spin", (path3 == null ? null : path3 + "rules.spin"));
	}

	private void compareAxioms(String path1, String path2, String path3) throws IOException {
		Pattern p = Pattern.compile("([^\\n]*)"); // axioms

		compareSets(p, path1 + "axioms.nt", path2 + "axioms.nt", (path3 == null ? null : path3 + "axioms.nt"));
	}

	private void compareSets(Pattern p, String path1, String path2, String path3) throws IOException {
		List<String> ids0 = new ArrayList<String>();
		String file0 = IOUtils.readFromFile(new File(path1));
		Matcher m = p.matcher(file0);
		while (m.find()) {
			String id = m.group(1).trim();
			if (id.isEmpty())
				continue;

			if (ids0.contains(id))
				System.out.println("found duplicate id (ids0): " + id);

			ids0.add(id);
		}

		System.out.println("ids0.length: " + ids0.size());

		List<String> ids1 = new ArrayList<String>();
		String file1 = IOUtils.readFromFile(new File(path2));

		m = p.matcher(file1);
		while (m.find()) {
			String id = m.group(1).trim();
			if (id.isEmpty())
				continue;

			if (ids1.contains(id))
				System.out.println("found duplicate id (ids1): " + id);

			ids1.add(id);
		}

		System.out.println("ids1.length: " + ids1.size());

		List<String> ids2 = new ArrayList<String>();
		if (path3 != null) {
			String file2 = IOUtils.readFromFile(new File(path3));

			m = p.matcher(file2);
			while (m.find()) {
				String id = m.group(1).trim();
				if (id.isEmpty())
					continue;

				if (ids2.contains(id))
					System.out.println("found duplicate id (ids2): " + id);

				ids2.add(id);
			}

			System.out.println("ids2.length: " + ids2.size());

			for (String id1 : ids1)
				if (ids2.contains(id1))
					System.out.println("found shared id (ids1, ids2): " + id1);
		}

		List<String> allIds = new ArrayList<String>();
		allIds.addAll(ids1);
		allIds.addAll(ids2);

		for (String id0 : ids0)
			if (!allIds.contains(id0))
				System.out.println("id not found (ids0 > allIds): " + id0);

		for (String allId : allIds)
			if (!ids0.contains(allId))
				System.out.println("id not found (allIds > ids0): " + allId);
	}

	// - cleanup
	public void cleanupIds() throws IOException {
		cleanupIds(new File("C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/www/res/owl/data/ore-small"));
	}

	public void cleanupIds(File folder) throws IOException {
		File[] files = folder.listFiles();

		for (File file : files) {

			if (file.isDirectory())
				cleanupIds(file);

			else {
				String contents = IOUtils.readFromFile(file);
				if (contents.startsWith("id: ")) {
					Log.d("cleaning up file: " + file.getAbsolutePath());

					contents = contents.substring(contents.indexOf("\n") + 1);
					IOUtils.writeToFile(contents, file);
				}
			}
		}
	}

	// - compare different reasoning outputs

	public void compareOwlOutputs() throws IOException {
		String rootPath = "C:/Users/William/git/mobibench/MobiBenchEngineJS/www/res/owl/output/"
				+ "ontology_inference/";

		// compareOutputs(rootPath, "owl2rl", "androjena", "owl2rl",
		// "androjena",
		// "[inf-schema]-inst_rules",
		// "[inf-schema,extra-axioms,gener-rules,domain-based]-inst_rules");

		// compareOutputs(rootPath, "builtin", "hermit", "owl2rl", "androjena",
		// "full", "full-aux_rules");
		compareOutputs(rootPath, "builtin", "pellet", "owl2rl", "androjena", "owl", "full-aux_rules");
		// compareOutputs(rootPath, "builtin", "hermit", "builtin", "pellet",
		// "full", "owl");
	}

	private void compareOutputs(String rootPath, String p1, String n1, String p2, String n2, String prefix1,
			String prefix2) throws IOException {

		compareOutputs(new File(rootPath + p1), p1, n1, p2, n2, prefix1, prefix2);
	}

	private void compareOutputs(File curDir, String p1, String n1, String p2, String n2, String prefix1, String prefix2)
			throws IOException {

		File[] files = curDir.listFiles();
		for (File file : files) {

			if (file.isDirectory()) {
				compareOutputs(file, p1, n1, p2, n2, prefix1, prefix2);

			} else {
				File f1 = file;

				if (!f1.getName().startsWith(prefix1 + "-" + n1))
					continue;

				List<String> contents1 = collect(f1);
				String id1 = pathId(f1.getAbsolutePath());

				String path2 = f1.getAbsolutePath();
				path2 = path2.replace(p1, p2).replace(n1, n2);

				String part2 = path2.substring(path2.lastIndexOf("\\"));
				part2 = part2.replace(prefix1, prefix2);

				path2 = path2.substring(0, path2.lastIndexOf("\\")) + part2;

				File f2 = new File(path2);

				List<String> contents2 = collect(f2);
				String id2 = pathId(f2.getAbsolutePath());

				Log.d("> " + id1 + " <=> " + id2);

				compare(contents1, contents2, n2 + " (" + prefix2 + ")");
				// compare(contents2, contents1, n1 + " (" + prefix1 + ")");
			}
		}
	}

	private String pathId(String path) {
		return path.substring(path.indexOf("output") + 7);
	}

	// @formatter:off
	Pattern lineP = Pattern.compile("([^\\n]*)");
	
	String[] linesToIgnore = { 
		// - OWL2 DL -> OWL2 RL 
		"<http://www.w3.org/2002/07/owl#disjointWith>",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Class> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#NamedIndividual> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#ObjectProperty> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#DatatypeProperty> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#SymmetricProperty> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#AsymmetricProperty> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#IrreflexiveProperty> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#TransitiveProperty> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#FunctionalProperty> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#InverseFunctionalProperty> .",
		// cfr. https://www.w3.org/TR/owl2-profiles/#OWL_2_RL; top, bottom X properties are not supported
		"<http://www.w3.org/2000/01/rdf-schema#subPropertyOf> <http://www.w3.org/2002/07/owl#topDataProperty>",
		"<http://www.w3.org/2000/01/rdf-schema#subPropertyOf> <http://www.w3.org/2002/07/owl#topObjectProperty>",
		"<http://www.w3.org/2002/07/owl#propertyDisjointWith> <http://www.w3.org/2002/07/owl#bottomObjectProperty> .",
		"<http://www.w3.org/2002/07/owl#propertyDisjointWith> <http://www.w3.org/2002/07/owl#topObjectProperty> .",
		"<http://www.w3.org/2002/07/owl#propertyDisjointWith>",
		"<http://www.w3.org/2000/01/rdf-schema#subClassOf>",
		"<http://www.w3.org/2000/01/rdf-schema#subPropertyOf>",
		// - OWL2 RL -> OWL2 DL
		"<http://www.w3.org/2002/07/owl#Thing>",
		"<http://www.w3.org/2002/07/owl#Nothing>",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2000/01/rdf-schema#Datatype> .",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#AnnotationProperty> .",
		"<http://www.w3.org/2002/07/owl#inverseOf>",
		"<http://www.w3.org/2002/07/owl#equivalentClass>",
		"<http://www.w3.org/2002/07/owl#equivalentProperty>",
		"<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Ontology> .",
		"<http://niche.cs.dal.ca/owl/list#hasMember>",
		"<http://niche.cs.dal.ca/owl/bNode"
	};
	Pattern[] psToIgnore = {
		// - OWL2 DL -> OWL2 RL
		Pattern.compile("genid([0-9])+"),
	};
	
	Pattern[] specialPs = {
		// - OWL2 RL -> OWL2 DL
		Pattern.compile("(.*?) (<http://www.w3.org/2002/07/owl#equivalentClass>|<http://www.w3.org/2000/01/rdf-schema#subClassOf>|<http://www.w3.org/2000/01/rdf-schema#subPropertyOf>|<http://www.w3.org/2002/07/owl#equivalentProperty>) (.*?) \\.")
	};
	// @formatter:on

	private List<String> collect(File file) throws IOException {
		String contents = IOUtils.readFromFile(file);

		List<String> lines = new ArrayList<String>();
		Matcher m = lineP.matcher(contents);
		l1: while (m.find()) {
			String line = m.group(1).trim();

			if (line.isEmpty())
				continue;

			for (String lineToIgnore : linesToIgnore) {
				if (line.contains(lineToIgnore))

					continue l1;
			}

			for (Pattern pToIgnore : psToIgnore) {
				if (pToIgnore.matcher(line).find())

					continue l1;
			}

			for (Pattern specialP : specialPs) {
				Matcher m2 = specialP.matcher(line);
				if (m2.matches()) {

					String cl1 = m2.group(1);
					String cl2 = m2.group(3);

					if (cl1.equals(cl2))
						continue l1;
				}
			}

			lines.add(line);
		}

		// System.out.println("contents.length: " + lines.size());

		return lines;
	}

	private void compare(List<String> contents1, List<String> contents2, String id2) {

		for (String line1 : contents1) {
			// System.out.println("line1: " + line1);

			if (line1.startsWith("id: "))
				continue;

			// if (line1.contains(
			// "<http://www.w3.org/2002/07/owl#bottomObjectProperty>")
			// || line1.contains(
			// "<http://www.w3.org/2002/07/owl#bottomDataProperty>")
			// || line1.contains(
			// "<http://www.w3.org/2002/07/owl#topObjectProperty>")
			// || line1.contains(
			// "<http://www.w3.org/2002/07/owl#topDataProperty>"))
			//
			// continue;

			if (!contents2.contains(line1))
				System.out.println("not found in " + id2 + ": " + line1);
		}
	}

	// compare outputs of different preprocessing strategies
	public void comparePreprocessOutputs() throws IOException {
		String rootPath = "C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/"
				+ "www/res/owl/output/ontology_inference/owl2rl/ore-small/";

		String tmp1 = "<http://niche.cs.dal.ca/owl/tmp1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>";
		String tmp11 = "<http://niche.cs.dal.ca/owl/tmp1> <http://niche.cs.dal.ca/owl/reasoning/inIntersection>";
		String tmp2 = "<http://niche.cs.dal.ca/owl/tmp2> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>";
		String tmp22 = "<http://niche.cs.dal.ca/owl/tmp2> <http://niche.cs.dal.ca/owl/reasoning/inIntersection>";

		String[] tmps = { tmp1, tmp11, tmp2, tmp22 };

		int[] folders = { 0, 124, 62, 97 };
		for (int folder : folders) {
			Log.d("folder: " + folder);

			String path = rootPath + folder;

			File[] files = new File(path).listFiles();
			for (File file : files) {

				Log.d("file: " + file.getName());
				String contents = IOUtils.readFromFile(file);

				for (int i = 0; i < tmps.length; i++) {
					String tmp = tmps[i];
					int idx = contents.indexOf(tmp);

					while (idx != -1) {
						int idx2 = contents.indexOf("> .\n", idx + 1);

						String obj = contents.substring(idx + tmp.length(), idx2 + 1).trim();

						if ((i % 2) != 0 || obj.startsWith("<http://niche.cs.dal.ca/"))

							Log.d(tmp + " " + obj);

						idx = contents.indexOf(tmp, idx + 1);
					}
				}

				Log.d("");
			}

			Log.d("\n");
		}
	}

	// - count number of rules in particular rule file
	public void countNrRules(String file) throws IOException {
		int cnt = 0;
		String contents = IOUtils.readStr(new FileInputStream(file));

		int prevIdx = 0;
		int idx = contents.indexOf("# ");

		while (idx != -1) {
			cnt++;

			prevIdx = idx;
			idx = contents.indexOf("# ", prevIdx + 1);
		}

		System.out.println("# rules: " + cnt);
	}

	// - copy inference output to "materialized" folders
	public void copyInf(String dataset, String orName, String targetFolder, int from) throws IOException {

		String folder = "C:/Users/William/git/mobile-benchmarks/MobiBenchEngineJS/WebContent/res/owl/";

		String orPath = folder + "output/ontology_inference/owl2rl/" + dataset + "/";
		String targetPath = folder + "data/" + dataset + "/" + targetFolder + "/";

		for (int i = from;; i++) {
			File orFile = new File(orPath + i + "/" + orName + ".nt");

			if (!orFile.exists())
				break;

			File targetFile = new File(targetPath + i + ".nt");
			targetFile.getParentFile().mkdirs();

			FileWriter w = new FileWriter(targetFile);
			w.write(IOUtils.readFromFile(orFile));

			w.close();

			System.out.println(new Date(orFile.lastModified()));
			System.out.println("moving: " + orFile.getName() + " to " + targetFile.getName() + "\n");
		}
	}

	// - study effect of leaving out "inefficient" rules; list number of missing
	// inferences as a result of this removal
	public void summarizeNonConf(File file) throws IOException {
		Pattern pat = Pattern.compile("(.*?)\\s+(.*?)\\s+(.*?)\\s*\\.");

		String contents = IOUtils.readFromFile(file);
		String[] lines = contents.split("\n");

		int sameAs = 0;
		int typeOfThing = 0;
		int subClOfItself = 0;
		int equivClOfItself = 0;
		int subOfThing = 0;
		int nothingSubOf = 0;
		int subPrOfItself = 0;
		int equivPrOfItself = 0;

		for (String line : lines) {
			Matcher m = pat.matcher(line);
			if (!m.matches()) {
				System.err.println("malformed line: " + line);

				continue;
			}

			String s = m.group(1);
			String p = m.group(2);
			String o = m.group(3);

			boolean unknown = false;

			if (p.equals("<http://www.w3.org/2002/07/owl#sameAs>")) {
				if (s.equals(o))
					sameAs++;
				else
					unknown = true;

			} else if (p.equals("<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>")) {
				if (o.equals("<http://www.w3.org/2002/07/owl#Thing>"))
					typeOfThing++;
				else
					unknown = true;

			} else if (p.equals("<http://www.w3.org/2000/01/rdf-schema#subClassOf>")) {
				if (s.equals(o))
					subClOfItself++;

				else if (o.equals("<http://www.w3.org/2002/07/owl#Thing>"))
					subOfThing++;

				else if (s.equals("<http://www.w3.org/2002/07/owl#Nothing>"))
					nothingSubOf++;

				else
					unknown = true;

			} else if (p.equals("<http://www.w3.org/2002/07/owl#equivalentClass>")) {
				if (s.equals(o))
					equivClOfItself++;

			} else if (p.equals("<http://www.w3.org/2000/01/rdf-schema#subPropertyOf>")) {
				if (s.equals(o))
					subPrOfItself++;

				else
					unknown = true;

			} else if (p.equals("<http://www.w3.org/2002/07/owl#equivalentProperty>")) {
				if (s.equals(o))
					equivPrOfItself++;
				else
					unknown = true;

			} else
				unknown = true;

			// NOTE will also capture scm-dom1,etc (i.e., extra schema
			// constructs that will not influence instances)
			if (unknown && !p.equals("<http://www.w3.org/2000/01/rdf-schema#domain>")
					&& !p.equals("<http://www.w3.org/2000/01/rdf-schema#range>"))

				System.out.println("unknown inference: " + line);
		}

		System.out.println("sameAs: " + sameAs + "\ntypeOfThing: " + typeOfThing + "\nsubClOfItself: " + subClOfItself
				+ "\nequivCtOfItself: " + equivClOfItself + "\nsubOfThing: " + subOfThing + "\nnothingSubOf: "
				+ nothingSubOf + "\nsubPrOfItself: " + subPrOfItself + "\nequivPrOfItself: " + equivPrOfItself);
	}

	// - summarizes results of service matching, based on log output
	public void summarizeServiceMatchResults() throws Exception {
		String contents = IOUtils.readFromFile(new File("C:/Users/William/git/mobile-benchmarks/"
				+ "SPIN WebService/WebContent/data_logs/log_service_goal_schema.txt"));

		int ctr = 0;
		StringBuffer inferred = new StringBuffer();

		int infIdx = -1;
		while ((infIdx = contents.indexOf("<http://127.0.0.1/matches>", infIdx + 1)) != -1) {
			int dataStIdx = contents.lastIndexOf("..loading data", infIdx);
			int dataEndIdx = contents.indexOf("\n", dataStIdx);

			String data = contents.substring(dataStIdx, dataEndIdx);
			data = data.substring(data.indexOf("(") + 1, data.indexOf(")"));

			int ruleStIdx = contents.lastIndexOf("..executing rules", infIdx);
			int ruleEndIdx = contents.indexOf("\n", ruleStIdx);

			String rules = contents.substring(ruleStIdx, ruleEndIdx);
			rules = rules.substring(rules.indexOf("(") + 1, rules.indexOf(")"));

			ctr++;

			inferred.append(rules + " > " + data + "\n");
		}

		System.out.println("# inferred: " + ctr);
		System.out.println(inferred);
	}

	// > generic utility functions

	public void bulkRename(File folder, String toReplace, String replacement) throws IOException {
		File[] files = folder.listFiles();
		for (File file : files) {

			if (file.isDirectory()) {
				if (!file.getName().startsWith("."))

					bulkRename(file, toReplace, replacement);

			} else {
				if (file.getName().contains(toReplace)) {
					String newName = file.getName().replace(toReplace, replacement);

					File newFile = new File(folder, newName);
					System.out.println("newFile: " + newFile);

					file.renameTo(newFile);
				}
			}
		}
	}

	public void countNrStmts(File folder) throws IOException {
		List<Integer> sizes = new ArrayList<Integer>();

		int total = 0;
		File[] files = folder.listFiles();

		for (File file : files) {

			if (file.isDirectory())
				continue;

			String contents = IOUtils.readFromFile(file);
			String[] lines = contents.split("\n");

			int size = lines.length;
			total += size;

			sizes.add(size);
		}

		Collections.sort(sizes, Collections.reverseOrder());

		Log.d("sizes: " + sizes);
		Log.d("avg size: " + ((float) total / sizes.size()));
	}

	@SuppressWarnings("unchecked")
	public void countDistinctTerms(File... files) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();

		int nrServices = 0;

		int totalTerms = 0;
		List<Integer> sizes = new ArrayList<Integer>();

		for (File file : files) {
			Log.d("file: " + file.getName());

			String contents = IOUtils.readFromFile(file);

			String[] services = contents.split("\n\n");

			nrServices += services.length;
			Log.d("# services: " + services.length);

			for (String service : services) {
				String id = service.substring(0, service.indexOf("\n"));
				service = service.substring(service.indexOf("\n") + 1);

				Model m = ModelFactory.createDefaultModel();
				m.read(new ByteArrayInputStream(service.getBytes()), "", "N-TRIPLE");

				Map<String, Boolean> serviceMap = new HashMap<String, Boolean>();

				StmtIterator stmtIt = m.listStatements();
				while (stmtIt.hasNext()) {
					Statement stmt = stmtIt.next();

					collectDistinctTerms(stmt.getSubject(), map, serviceMap);
					collectDistinctTerms(stmt.getPredicate(), map, serviceMap);
					collectDistinctTerms(stmt.getObject(), map, serviceMap);
				}

				int size = serviceMap.size();

				totalTerms += size;
				sizes.add(size);

				Log.d("# distinct terms (" + id + "): " + size);
			}

			Log.d("");
		}

		Collections.sort(sizes, Collections.reverseOrder());

		Log.d("total # distinct terms: " + map.size());
		Log.d("# terms per service: " + sizes);
		Log.d("avg # terms per service: " + ((float) totalTerms / nrServices));
	}

	@SuppressWarnings("unchecked")
	private void collectDistinctTerms(RDFNode node, Map<String, Boolean>... maps) {

		if (node.isURIResource()) {
			String uri = node.asResource().getURI();

			if (!uri.contains("frozenVar") && !uri.startsWith("http://www.w3.org/1999/02/22-rdf-syntax-ns#")
					&& !uri.startsWith("http://www.w3.org/2002/07/owl#")
					&& !uri.startsWith("http://www.daml.org/services/owl-s/1.1/Process.owl#has")) {

				for (Map<String, Boolean> map : maps)
					map.put(uri, true);
			}
		}
	}

	public void countServiceSizes(File... files) throws IOException {
		int nrServices = 0;

		int totalSize = 0;
		List<Integer> sizes = new ArrayList<Integer>();

		for (File file : files) {
			Log.d("file: " + file.getName());

			String contents = IOUtils.readFromFile(file);

			String[] services = contents.split("\n\n");

			nrServices += services.length;
			Log.d("# services: " + services.length);

			for (String service : services) {
				String id = service.substring(0, service.indexOf("\n"));
				service = service.substring(service.indexOf("\n") + 1);

				int size = service.split("\n").length;

				totalSize += size;
				sizes.add(size);

				Log.d("size " + id + ": " + size);
			}

			Log.d("");
		}

		Collections.sort(sizes, Collections.reverseOrder());

		Log.d("sizes: " + sizes);
		Log.d("avg. size per service: " + ((float) totalSize / nrServices));
	}
}
