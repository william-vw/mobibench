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
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import wvw.table.LabelComparator;
import wvw.table.Row;
import wvw.table.Table;
import wvw.table.col.Column;

public abstract class ReportAnalyzer {

	private Pattern p1 = Pattern
			.compile("(.*?)-(.*?)-(.*?)=(\\[.*?\\]|[^\\[]*?)-(.*?)-(.*?)");
	private Pattern p2 = Pattern
			.compile("(.*?)-(.*?)-(.*?)=(\\[.*?\\]|[^\\[]*?)-(.*?)");
	private Pattern p3 = Pattern
			.compile("(.*?)-(.*?)=(\\[.*?\\]|[^\\[]*?)-(.*?)-(.*?)");
	private Pattern p4 = Pattern.compile("(.*?)-(.*?)=(.*?)-(\\[.*?\\])-(.*?)");

	private Pattern pt = Pattern.compile("(.*?)_(.*?)_(.*?)");

	private Map<String, Table> tables = new HashMap<String, Table>();

	protected String curId;

	private String mainFlow;
	private String task;
	private String mech;
	private String scope;
	private String subset;
	private String preprocess;
	private String dataset;

	protected void analyze(String folder) {
		Column.setLabelCmp(new LabelComparator());

		File folderFile = new File(folder);
		if (!folderFile.exists()) {
			System.err.println("folder " + folder + " does not exist");

			return;
		}

		File[] files = folderFile.listFiles();
		for (File file : files) {

			if (!handleFile(file))
				continue;

			if (!parseParameters(curId)) {
				System.err.println("id cannot be parsed: " + curId);

				continue;
			}

			String tableId = "(" + mainFlow + ") " + task + " > " + mech;

			Table table = tables.get(tableId);
			if (table == null) {
				table = new Table(tableId);

				tables.put(tableId, table);
			}

			Row row = table.getRow(dataset);

			if (mech.equals("owl2rl")) {
				Column topCol = null;
				Column subsetCol = new Column(subset);

				if (scope != null) {
					topCol = new Column(scope);

					topCol.add(subsetCol);

				} else
					topCol = subsetCol;

				String colLabel = preprocess;
				subsetCol.add(createValueColumn(colLabel));

				row.add(topCol);

			} else {
				String colLabel = null;

				if (scope != null)
					colLabel = scope;
				else
					colLabel = "none";

				row.add(createValueColumn(colLabel));
			}
		}
	}

	private boolean parseParameters(String fileName) {
		mainFlow = null;
		task = null;
		mech = null;
		scope = null;
		subset = null;
		preprocess = null;
		dataset = null;

		Matcher m1 = p1.matcher(fileName);
		if (m1.matches()) {
			// TODO .. better choice of dataset names
			if (!m1.group(5).equals("ore")) {
				mainFlow = m1.group(1);

				String str = m1.group(2);
				Matcher mt1 = pt.matcher(str);
				if (mt1.matches()) {
					task = mt1.group(1) + "_" + mt1.group(2);

					mech = mt1.group(3);
				}

				scope = m1.group(3);
				subset = m1.group(4);
				preprocess = m1.group(5);
				dataset = m1.group(6);

				return true;
			}
		}

		Matcher m2 = p2.matcher(fileName);
		if (m2.matches()) {
			mainFlow = m2.group(1);

			String str = m2.group(2);
			Matcher mt1 = pt.matcher(str);
			if (mt1.matches()) {
				task = mt1.group(1) + "_" + mt1.group(2);

				mech = mt1.group(3);
			}

			scope = m2.group(3);
			subset = m2.group(4);
			dataset = m2.group(5);

			return true;
		}

		Matcher m3 = p3.matcher(fileName);
		if (m3.matches()) {
			mainFlow = m3.group(1);

			String str = m3.group(2);
			Matcher mt1 = pt.matcher(str);
			if (mt1.matches()) {
				task = mt1.group(1) + "_" + mt1.group(2);

				mech = mt1.group(3);
			}

			subset = m3.group(3);
			preprocess = m3.group(4);
			dataset = m3.group(5);

			return true;
		}

		Matcher m4 = p4.matcher(fileName);
		if (m4.matches()) {
			mainFlow = m4.group(1);

			String str = m4.group(2);
			Matcher mt1 = pt.matcher(str);
			if (mt1.matches()) {
				task = mt1.group(1) + "_" + mt1.group(2);

				mech = mt1.group(3);
			}

			dataset = m4.group(3);
			dataset = dataset.replace("_", ">");

			scope = m4.group(4);

			dataset += " (" + m4.group(5) + ")";

			return true;
		}

		return false;
	}

	public Map<String, Table> getTables() {
		return tables;
	}

	protected abstract boolean handleFile(File file);

	protected abstract String getRowLabel();

	protected abstract Column createValueColumn(String label);
}
