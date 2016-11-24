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

public class Row {

	private String label;
	private List<Column> cols = new ArrayList<Column>();

	public Row(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public void add(Column newCol) {
		for (int i = 0; i < cols.size(); i++) {
			Column otherCol = cols.get(i);

			int cmp = newCol.compareTo(otherCol);
			switch (cmp) {
			
			case -1:
				cols.add(i, newCol);
				
				return;
				
			case 0:
				otherCol.merge(newCol);
				
				return;
			}
		}

		cols.add(newCol);
	}

	public List<Column> getCols() {
		return cols;
	}

	public String toString() {
		return "{ " + label + ": " + cols + " }";
	}
	
	public List<List<String>> getCsvHeaders() {
		List<List<String>> container = new ArrayList<List<String>>();
		
		for (Column col : cols)
			col.getCsvHeaders(container, 0);

		return container;
	}
}
