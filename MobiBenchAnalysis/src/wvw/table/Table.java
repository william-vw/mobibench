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
package wvw.table;

import java.util.ArrayList;
import java.util.List;

import wvw.table.col.Column;

public class Table {

	private String label;

	private List<Row> rows = new ArrayList<Row>();

	public Table(String label) {
		this.label = label;
	}

	public void add(Row row) {
		rows.add(row);
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public Row getRow(String label) {
		for (Row row : rows)
			if (row.getLabel().equals(label))
				return row;

		Row row = new Row(label);
		rows.add(row);

		return row;
	}

	public List<Row> getRows() {
		return rows;
	}

	public String toString() {
		return "{ " + label + ": " + rows + " }";
	}

	public String toCsv() {
		if (rows.isEmpty())
			return "";

		StringBuffer csv = new StringBuffer();
		csv.append(label).append(";\n");

		List<List<String>> headerContainer = rows.get(0).getCsvHeaders();
		for (List<String> headers : headerContainer) {
			csv.append(";");

			for (String header : headers)
				csv.append(header).append(";");

			csv.append("\n");
		}

		for (Row row : rows) {
			csv.append(row.getLabel()).append(";");

			for (Column col : row.getCols())
				col.toCsv(csv);

			csv.append("\n");
		}

		return csv.toString();
	}
}
