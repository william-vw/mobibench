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
package wvw.table.col;

import java.util.ArrayList;
import java.util.List;

import wvw.table.LabelComparator;

public class Column {

	protected static LabelComparator labelCmp = new LabelComparator();

	protected String label;
	protected List<Column> subCols = new ArrayList<Column>();

	public Column(String label) {
		this.label = label;
	}

	public static void setLabelCmp(LabelComparator labelCmp) {
		Column.labelCmp = labelCmp;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public void add(Column newCol) {
		for (int i = 0; i < subCols.size(); i++) {
			Column subCol = subCols.get(i);

			int cmp = newCol.compareTo(subCol);
			switch (cmp) {

			case -1:
				subCols.add(i, newCol);

				return;

			case 0:
				subCol.merge(newCol);

				return;
			}
		}

		subCols.add(newCol);
	}

	public List<Column> getSubCols() {
		return subCols;
	}

	public int compareTo(Column otherCol) {
		return labelCmp.compareTo(label, otherCol.getLabel());
	}

	public void merge(Column otherCol) {

		for (Column otherSubCol : otherCol.getSubCols())
			add(otherSubCol);
	}

	public String toString() {
		return subCols.toString();
	}

	public void getCsvHeaders(List<List<String>> container, int idx) {
		List<String> headers = null;
		if (idx >= container.size()) {
			headers = new ArrayList<String>();

			container.add(idx, headers);

		} else
			headers = container.get(idx);

		headers.add(label);

		if (!subCols.isEmpty()) {
			int begin = ((idx + 1) < container.size() ? container.get(idx + 1).size() : 0);

			for (Column subCol : subCols)
				subCol.getCsvHeaders(container, idx + 1);

			int end = container.get(idx + 1).size();

			for (int i = 0; i < (end - begin) - 1; i++)
				headers.add("");
		}
	}

	public void toCsv(StringBuffer csv) {
		for (Column subCol : subCols)
			subCol.toCsv(csv);
	}
}
