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
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import wvw.table.col.Column;
import wvw.table.col.IntColumn;
import wvw.utils.IOUtils;

public class HeapDumpAnalyzer extends ReportAnalyzer {

	private String className;

	private int value;

	public void analyzeHeapReports(String folder, String className) {
		System.out.println(".. analyzing heap reports");

		this.className = className;

		analyze(folder);
	}

	protected boolean handleFile(File file) {
		String fileName = file.getName();

		if (!fileName.endsWith("_System_Overview.zip"))
			return false;

		curId = fileName.substring(0, fileName.indexOf("_System_Overview.zip"));

		try {
			System.out.println("file: " + file.getName());
			
			// - get retained heap
			ZipFile overview = new ZipFile(file);
			ZipEntry entry = overview.getEntry("pages\\Class_Histogram6.html");

			InputStream in = overview.getInputStream(entry);
			String contents = IOUtils.readStr(in, false);

			int idx = contents.indexOf(className);

			int stIdx = contents.indexOf("&gt;=", idx);
			int endIdx = contents.indexOf("</td>", stIdx);

			int retainedHeap = Integer.valueOf(contents.substring(stIdx + 5, endIdx)
					.trim().replaceAll(",", ""));

			idx = file.getName().indexOf("_System_Overview.zip");
			String id = file.getName().substring(0, idx);

			System.out.println("id: " + id);
			System.out.println("retainedHeap: " +
					((double) retainedHeap) / 1024 + "\n");

			this.value = retainedHeap;

			overview.close();

			return true;

		} catch (IOException e) {
			e.printStackTrace();

			return false;
		}
	}

	protected String getRowLabel() {
		return "memory (bytes)";
	}
	
	protected Column createValueColumn(String label) {
		return new IntColumn(label, value);
	}
}
