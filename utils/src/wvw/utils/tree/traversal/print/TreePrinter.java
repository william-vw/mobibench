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

package wvw.utils.tree.traversal.print;

import wvw.utils.tree.TreeNode;
import wvw.utils.tree.traversal.TraversalListener;

/**
 * @author wvw
 */

public class TreePrinter implements TraversalListener {

	private int uriLen = 20;

	private int curLvl = 0;
	private boolean firstNodeEdge = false;

	private StringBuilder print = new StringBuilder();

	public void rootDiscovered(TreeNode node) {
	}

	public void rootProcessed(TreeNode node) {
	}

	public void nodeDiscovered(TreeNode node) {
		if (curLvl > 0) {

			if (!firstNodeEdge) {
				print.append("\n");

				print.append(genWhitespaceLvls(curLvl));
			}

			print.append(" <-- ");
		}

		print.append(print(node.getLabel(), uriLen));

		curLvl++;
		firstNodeEdge = true;
	}

	public void nodeProcessed(TreeNode node) {
		curLvl--;

		firstNodeEdge = false;
	}

	public String getString() {
		return print.toString();
	}

	protected String print(String str, int reqLength) {
		int idx = str.lastIndexOf("/");
		int idx2 = str.lastIndexOf("#");
		if (idx2 > idx)
			idx = idx2;

		str = str.substring(idx + 1);

		if (str.length() > reqLength)
			// + 2 for ".."
			return ".." + str.substring(str.length() - reqLength + 2);

		else if (str.length() < reqLength)
			return str + genWhitespace(reqLength - str.length());

		else
			return str;
	}

	private String genWhitespaceLvls(int lvls) {
		// + 5 for arrows
		int nrWhitespaces = (lvls - 1) * 5 + lvls * uriLen;

		return genWhitespace(nrWhitespaces);
	}

	protected String genWhitespace(int nr) {
		StringBuilder whitespace = new StringBuilder();
		while (nr-- > 0)
			whitespace.append(" ");

		return whitespace.toString();
	}
}
