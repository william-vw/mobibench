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

public class LabelComparator {

	private String[][] order =
			new String[][] {
					{ "owl_full", "owl_mini", "owl_micro", "rdfs_full", "rdfs_default",
							"rdfs_simple" }, { "red\\s.*", "red\\d.*" } };

	public int compareTo(String label1, String label2) {
		int ret = cmpStrs(order, label1, label2);
		if (ret != 0)
			return ret;

		ret = cmpOps(label1, label2);
		if (ret != 0)
			return ret;

		ret = cmpInts(label1, label2);
		if (ret != 0)
			return ret;
		
		return label1.compareTo(label2);
	}

	private int cmpStrs(String[][] strss, String label1, String label2) {
		if (cmpStr(strss, label1, label2))
			return -1;
		else if (cmpStr(strss, label2, label1))
			return 1;
		else
			return 0;
	}

	private boolean cmpStr(String[][] strss, String label1, String label2) {
		for (String[] strs : strss) {
			for (int i = 0; i < strs.length; i++) {

				if (label1.matches(strs[i])) {
					for (int j = i + 1; j < strs.length; j++) {

						if (label2.matches(strs[j]))
							return true;
					}

					return false;
				}
			}
		}

		return false;
	}
	
	private int cmpOps(String label1, String label2) {
		if (label1.startsWith("load")) {
			if (label2.startsWith("load")) {

				if (label1.startsWith("loadRules"))
					return -1;
				else
					return 1;

			} else
				return -1;

		} else if (label1.startsWith("total")) {
			if (label2.startsWith("total")) {

				if (label1.startsWith("totalInf"))
					return -1;
				else
					return 1;

			} else
				return 1;
		}

		return 0;
	}

	private int cmpInts(String label1, String label2) {
		int colInt1 = getColInt(label1);
		int colInt2 = getColInt(label2);

		if (colInt1 != -1 && colInt2 != -1) {
			try {
				if (colInt1 < colInt2)
					return -1;

				else if (colInt1 > colInt2)
					return 1;
				else
					return 0;

			} catch (NumberFormatException e) {
			}
		}

		return 0;
	}

	private int getColInt(String label) {
		int labelInt = -1;

		try {
			labelInt = Integer.valueOf(label);

		} catch (NumberFormatException e) {
			int usIdx = label.indexOf("_");

			if (usIdx != -1) {
				try {
					label = label.substring(usIdx + 1);

					labelInt = Integer.valueOf(label);

				} catch (NumberFormatException e1) {
				}
			}
		}

		return labelInt;
	}
}
