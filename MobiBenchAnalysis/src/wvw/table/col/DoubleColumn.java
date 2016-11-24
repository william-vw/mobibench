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

public class DoubleColumn extends Column {

	private double value = -1;

	public DoubleColumn(String label) {
		super(label);
	}

	public DoubleColumn(String label, double value) {
		super(label);
		
		this.value = value;
	}
	
	public boolean hasValue() {
		return value != -1;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public String toString() {
		return "{ " + label + ": " + (hasValue() ? value : subCols) + " }";
	}

	public void toCsv(StringBuffer csv) {
		if (hasValue())
			csv.append(value).append(";");

		else
			super.toCsv(csv);
	}
}
