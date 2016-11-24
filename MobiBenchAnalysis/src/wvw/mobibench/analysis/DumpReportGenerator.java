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

import wvw.utils.IOUtils;

public class DumpReportGenerator {

	public void generateDumpReport(String folder, String matPath, String dumpFolder,
			String convFolder) {

		System.out.println(".. generating dump reports");

		convertDumps(folder, dumpFolder, convFolder);

		File errorFile = new File(folder, "failed_generateDumpReports.txt");

		// String failedReports = null;
		// try {
		// failedReports = IOUtils.readFromFile(errorFile);
		//
		// } catch (IOException e1) {
		// e1.printStackTrace();
		//
		// return;
		// }

		String parseHeapDump = matPath;

		File[] files = new File(convFolder).listFiles();
		for (File file : files) {

			if (file.getName().endsWith(".hprof")) {
				try {
					String filePath = file.getAbsolutePath();
					System.out.println("path: " + filePath);

					// if (failedReports.contains(file.getName())) {
					// System.out.println("report already failed before - skipping\n");
					//
					// continue;
					// }

					int idx = filePath.lastIndexOf(".");
					String testPath = filePath.substring(0, idx) + "_System_Overview.zip";

					// System.out.println("testPath: " + testPath);
					if (new File(testPath).exists()) {
						System.out.println("report already generated - skipping\n");

						continue;
					}

					String cmd = parseHeapDump + " \"" + filePath
							+ "\" org.eclipse.mat.api:overview";
					System.out.println("cmd: " + cmd);

					Process process = Runtime.getRuntime().exec(/* "cmd /c " + */cmd);

					int exit = process.waitFor();
					if (exit != 0) {
						String msg = "parseHeapDump failed for " + file.getName() + "\n";

						System.err.println(msg);
						IOUtils.writeToFile(msg, errorFile, true);

						// System.err.println("dump deleted: " + file.delete());

						continue;
					}

					System.out.println("");

				} catch (IOException | InterruptedException e) {
					e.printStackTrace();

					continue;
				}
			}
		}

		System.out.println("\n");
	}

	private void convertDumps(String folder, String dumpFolder, String convFolder) {
		System.out.println(".. converting dumps");

		File errorFile = new File(folder + "failed_convertDumps.txt");

		File[] files = new File(dumpFolder).listFiles();
		for (File file : files) {

			if (file.getName().endsWith(".hprof")) {
				try {
					String filePath = file.getAbsolutePath();
					System.out.println("path: " + filePath);
					
					String newFilePath = new File(convFolder, file.getName()).getAbsolutePath();
					// System.out.println("newFilePath: " + newFilePath);

					if (new File(newFilePath).exists()) {
						System.out.println("already converted - skipping\n");

						continue;
					}

					String cmd = "hprof-conv " + filePath + " " + newFilePath;
					System.out.println("cmd: " + cmd);

					Process process = Runtime.getRuntime().exec("cmd /c " + cmd);

					int exit = process.waitFor();
					if (exit != 0) {
						String msg = "hprof-conv failed for " + file.getName();

						System.err.println(msg);
						IOUtils.writeToFile(msg, errorFile, true);

						return;
					}

					System.out.println("");

				} catch (IOException | InterruptedException e) {
					e.printStackTrace();

					return;
				}
			}
		}

		System.out.println("\n");
	}
}
