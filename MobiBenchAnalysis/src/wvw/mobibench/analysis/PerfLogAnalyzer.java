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

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import wvw.table.col.Column;
import wvw.table.col.DoubleColumn;
import wvw.utils.ArrayUtils;

public class PerfLogAnalyzer extends ReportAnalyzer {

	private String sep = "--";

	private List<String> colLabels = new ArrayList<String>();
	private List<List<ActionValue>> allActions = new ArrayList<List<ActionValue>>();

	private ActionValue infAv;
	// private ActionValue totalAv;

	private String[] merge = new String[] { "axioms-rules", "ontology-rules" };

	public void analyzePerformanceLogs(String folder) {
		System.out.println(".. analyzing performance logs");

		analyze(folder);
	}

	public void compare(String folder, String dataset1, String dataset2, PerfOutput output1,
			PerfOutput output2) {

		int cnt1 = 0;
		int cnt2 = 0;
		int totalCnt = 0;

		double diff1 = 0;
		double diff2 = 0;

		String name1 = output1.getName();
		String name2 = output2.getName();

		System.out.println(name1 + " <> " + name2);
		for (int i = 0;; i++) {
			File f1 = new File(folder + output1.getFile(dataset1, i));
			File f2 = new File(folder + output2.getFile(dataset2, i));
			
			if (!f1.exists() ^ !f2.exists()) {
				if (!f1.exists())
					System.err.println("missing:\n" + f1);
				else
					System.err.println("missing:\n" + f2);

				continue;
			}

			if (!f1.exists()) {
				System.out.println("(not found: " + f1
						+ ") (may just be at the end of the benchmarks)");

				break;
			}

			handleFile(f1);
			double infAv1 = infAv.getValue();

			// System.out.println(allActions);

			handleFile(f2);
			double infAv2 = infAv.getValue();

			// System.out.println(allActions);

			diff1 += infAv1 - infAv2;
			diff2 += infAv2 - infAv1;

			if (infAv1 < infAv2)
				cnt1++;
			else
				cnt2++;

			totalCnt++;

			System.out.println(i + ": " + infAv1 + " <> " + infAv2
					+ " (" + (infAv1 < infAv2 ? name1 : name2) + " smaller)");
		}

		System.out.println();
		System.out.println("# times " + name1 + " is smaller: " + cnt1);
		System.out.println("avg infAv1 - infAv2: " + (diff1 / totalCnt));
		System.out.println();
		System.out.println("# times " + name2 + " is smaller: " + cnt2);
		System.out.println("avg infAv2 - infAv1: " + (diff2 / totalCnt));
		System.out.println();
	}

	public boolean handleFile(File file) {
		allActions.clear();
		colLabels.clear();

		String fileName = file.getName();

		if (!fileName.endsWith(".txt"))
			return false;

		curId = fileName.substring(0, fileName.indexOf(".txt"));

		List<ActionValue> curActions = null;

		try {
			BufferedReader reader = new BufferedReader(new FileReader(file));

			String line = null;
			while ((line = reader.readLine()) != null) {

				if (line.startsWith(sep)) {
					curActions = new ArrayList<ActionValue>();
					allActions.add(curActions);

					colLabels.add(line.substring(sep.length()).trim());
				}

				int avgIdx = line.indexOf("avg");
				if (avgIdx == -1)
					continue;

				int colIdx = line.indexOf(":");
				String action = line.substring(0, colIdx);

				colIdx = line.indexOf(":", colIdx + 1);
				double value = Double.valueOf(line.substring(colIdx + 2));

				boolean found = false;
				for (ActionValue av : curActions) {

					if (av.getAction().equals(action)) {
						av.add(value);

						found = true;
					}
				}

				if (!found)
					curActions.add(new ActionValue(action, value));
			}

			reader.close();

			if (merge.length > 0)
				merge();

			collectTotals();

			return true;

		} catch (IOException e) {
			e.printStackTrace();

			return false;
		}
	}

	private void collectTotals() {
		for (List<ActionValue> actions : allActions) {
			ActionValue infAv = new ActionValue("totalInf");
			ActionValue totalAv = new ActionValue("total");

			for (ActionValue av : actions) {

				if (av.getAction().equals("loadData") ||
						av.getAction().equals("loadOntology") ||
						av.getAction().equals("loadRules"))

					totalAv.add(av.getValue());

				else if (av.getAction().equals("createRules") ||
						av.getAction().equals("executeRules") ||
						av.getAction().equals("execute") ||
						av.getAction().equals("inference") ||
						av.getAction().equals("collectInferred")) {

					infAv.add(av.getValue());

					totalAv.add(av.getValue());
				}
			}

			this.infAv = infAv;
			// this.totalAv = totalAv;

			actions.add(infAv);
			actions.add(totalAv);
		}
	}

	private void merge() {
		for (int i = 0; i < colLabels.size(); i++) {
			String colLabel = colLabels.get(i);

			for (int j = i + 1; j < colLabels.size(); j++) {
				String colLabel2 = colLabels.get(j);

				if (colLabel.equals(colLabel2)) {
					colLabels.remove(j);

					allActions.remove(j--);
				}
			}
		}

		for (int i = 0; i < allActions.size(); i++) {
			List<ActionValue> actions = allActions.get(i);
			String colLabel = colLabels.get(i);

			if (!ArrayUtils.contains(merge, colLabel)) {
				// System.err.println("error: unknown \"" + colLabel + "\"");

				return;
			}

			for (int j = i + 1; j < allActions.size(); j++) {
				List<ActionValue> actions2 = allActions.get(j);
				String colLabel2 = colLabels.get(j);

				if (!ArrayUtils.contains(merge, colLabel2)) {
					// System.err.println("error: unknown \"" + colLabel +
					// "\"");

					return;
				}

				for (ActionValue av1 : actions) {

					boolean found = false;
					for (ActionValue av2 : actions2) {

						if (av1.getAction().equals(av2.getAction())) {
							found = true;

							av2.add(av1.getValue());
							break;
						}
					}

					if (!found)
						actions2.add(av1);
				}

				allActions.remove(i);
				colLabels.remove(i--);
			}
		}
	}

	protected String getRowLabel() {
		return "performance (ms)";
	}

	protected Column createValueColumn(String label) {
		Column col = new Column(label);

		if (allActions.size() > 1)

			for (int i = 0; i < allActions.size(); i++) {
				List<ActionValue> actions = allActions.get(i);
				String subLabel = colLabels.get(i);

				Column subCol = new Column(subLabel);
				col.add(subCol);

				for (ActionValue action : actions)
					subCol.add(new DoubleColumn(action.getAction(), action.getValue()));
			}

		else
			for (ActionValue action : allActions.get(0))
				col.add(new DoubleColumn(action.getAction(), action.getValue()));

		return col;
	}

	private class ActionValue {

		private String action;
		private double value;

		public ActionValue(String action) {
			this.action = action;
		}

		public ActionValue(String action, double value) {
			this.action = action;
			this.value = value;
		}

		public String getAction() {
			return action;
		}

		public double getValue() {
			return value;
		}

		public void add(double add) {
			value += add;
		}

		public String toString() {
			return action + ": " + value;
		}
	}
}
