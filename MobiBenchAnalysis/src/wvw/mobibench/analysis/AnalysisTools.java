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
package wvw.mobibench.analysis;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import wvw.table.Table;
import wvw.utils.IOUtils;
import wvw.utils.cmd.CmdOption;
import wvw.utils.cmd.CmdOptionListener;
import wvw.utils.cmd.CmdUtils;
import wvw.utils.cmd.OptionDependency;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;

public class AnalysisTools {

	private Map<String, Table> tables = new HashMap<String, Table>();

	public static String[] mainTasks = { "summarize", "compare" };
	public static String[] summarizeTasks = { "performance", "memory" };

	private static String task;
	private static String metric;
	private static PerfOutput o1 = new PerfOutput();
	private static String d1;
	private static PerfOutput o2 = new PerfOutput();
	private static String d2;
	private static String matPath;
	private static String className;
	private static String folder;
	private static String dumpFolder;
	private static String convFolder;
	private static String perfFolder;

	private static CmdUtils cmdUtils = null;

	private static void initCmd() {
		cmdUtils = new CmdUtils("java -jar mb-analysis.jar <options>", new CmdOptionListener() {

			public boolean cmdOptionValue(String name, Object value) {				
				if (!(value instanceof String))
					return true;

				String val = (String) value;

				if (name.equals("task"))
					task = val;

				else if (name.equals("metric"))
					metric = val;

				else if (name.matches("e[1|2]")) {
					if (name.endsWith("1"))
						o1.setEngine(val);
					else
						o2.setEngine(val);

				} else if (name.matches("t[1|2]")) {
					if (name.endsWith("1"))
						o1.setSubtask(val);
					else
						o2.setSubtask(val);

				} else if (name.matches("s[1|2]")) {
					String[] sel = val.split(",");

					if (name.endsWith("1"))
						o1.setSelections(sel);
					else
						o2.setSelections(sel);

				} else if (name.matches("d[1|2]")) {
					if (name.endsWith("1"))
						d1 = val;
					else
						d2 = val;

				} else if (name.equals("matPath"))
					matPath = val;

				else if (name.equals("className"))
					className = val;

				else if (name.equals("folder")) {					
					folder = val;

					dumpFolder = folder;
					convFolder = new File(dumpFolder, "conv/").getPath();

					perfFolder = folder;
				}

				return true;
			}
		},
		// @formatter:off
		new CmdOption("task", "task to be performed", mainTasks, true),
		new CmdOption("metric", "metric to be summarized", summarizeTasks,
				new OptionDependency("task", "summarize")),
		new CmdOption("e1", "first engine to compare", true, new OptionDependency("task", "compare")),
		new CmdOption("t1", "first task to compare", true, new OptionDependency("task", "compare")),
		new CmdOption("s1", "first selections to compare (comma-separated)", true, false),
		new CmdOption("d1", "first dataset to compare", true, new OptionDependency("task", "compare")),
		new CmdOption("e2", "second engine to compare", true, new OptionDependency("task", "compare")),
		new CmdOption("t2", "second task to compare", true, new OptionDependency("task", "compare")),
		new CmdOption("s2", "second selections to compare (comma-separated)", true, false),
		new CmdOption("d2", "second dataset to compare", true, new OptionDependency("task", "compare")),
		new CmdOption("matPath", "path to the MAT .bat file", "C:/Program Files/mat/ParseHeapDump.bat"),
		new CmdOption("folder",
				"folder containing the performance logs / dump files to be analyzed, and where CSV files "
						+ "(and potential error files) will be stored", true, false),
		new CmdOption("className",
				"class to be analyzed during heap analysis (e.g., wvw.mobibench.engine.AndroJena)", true,
				new OptionDependency("metric", "memory")));
		// @formatter:on
	}

	private static void init() {
		Log.setTarget(new SystemOutTarget());
	}
	
	public static void main(String[] args) {
		init();
		
		initCmd();
		if (!cmdUtils.process(args))
			return;

		System.out.println(cmdUtils);

		AnalysisTools run = new AnalysisTools();

		try {
			if (task.equals("summarize")) {

				if (metric.equals("performance"))
					run.perfLogsToCsv(folder, perfFolder);

				else if (metric.equals("memory"))
					run.heapDumpsToCsv(folder, matPath, dumpFolder, convFolder, className);

			} else if (task.equals("compare")) {
				run.compare();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void perfLogsToCsv(String folder, String perfFolder) throws IOException {
		PerfLogAnalyzer analyzer = new PerfLogAnalyzer();
		analyzer.analyzePerformanceLogs(perfFolder);

		this.tables = analyzer.getTables();

		tablesToCsv(new File(folder, "summary.csv"));
	}

	public void heapDumpsToCsv(String folder, String matPath, String dumpFolder, String convFolder, String className)
			throws IOException {

		new File(convFolder).mkdir();

		DumpReportGenerator gen = new DumpReportGenerator();
		gen.generateDumpReport(folder, matPath, dumpFolder, convFolder);

		HeapDumpAnalyzer analyzer = new HeapDumpAnalyzer();
		analyzer.analyzeHeapReports(convFolder, className);

		this.tables = analyzer.getTables();

		tablesToCsv(new File(folder, "dumps.csv"));
	}

	private void tablesToCsv(File targetFile) throws IOException {
		targetFile.delete();

		String path = targetFile.getAbsolutePath();

		String id = path.substring(path.lastIndexOf("/") + 1);
		System.out.println(".. writing to csv (" + id + ")");

		Iterator<Table> tableIt = tables.values().iterator();
		while (tableIt.hasNext()) {
			Table table = tableIt.next();

			String csv = table.toCsv();
			// System.out.println(csv);

			IOUtils.writeToFile(csv, targetFile, true);
		}
	}

	public void compare() {
		PerfLogAnalyzer analyzer = new PerfLogAnalyzer();

		analyzer.compare(folder, d1, d2, o1, o2);
	}
}
