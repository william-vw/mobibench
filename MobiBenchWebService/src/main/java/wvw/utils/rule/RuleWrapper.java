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
package wvw.utils.rule;

public class RuleWrapper {

	private String comment;

	private String rule;
	private String axioms;

	public RuleWrapper(String str) {
		str = str.trim();
		// Log.d("RuleWrapper.str: " + str);

		int prevIdx = 0;

		int ctIdx = str.indexOf("#", prevIdx);
		int nlIdx = str.indexOf("\n", prevIdx);

		StringBuffer comment = new StringBuffer();
		while (true) {
			comment.append(str.substring(ctIdx, nlIdx + 1));

			prevIdx = nlIdx + 1;

			ctIdx = str.indexOf("#", prevIdx);
			nlIdx = str.indexOf("\n", prevIdx);

			if (ctIdx != prevIdx)
				break;
		}

		this.comment = comment.toString().trim();

		int lsIdx = str.indexOf("}", str.indexOf("}") + 1);
		if ((lsIdx + 1) != str.length()) {
			this.rule = str.substring(prevIdx, lsIdx + 1);

			this.axioms = str.substring(lsIdx + 2);

		} else
			this.rule = str.substring(prevIdx);
	}

	public RuleWrapper(String comment, String rule) {
		this.comment = comment;

		this.rule = rule;
	}

	public boolean hasComment() {
		return comment != null;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public boolean hasAxioms() {
		return axioms != null;
	}

	public String getAxioms() {
		return axioms;
	}

	public void setAxioms(String axioms) {
		this.axioms = axioms;
	}

	public String toString() {
		return comment + "\n" + rule + "\n" + axioms;
	}
}
