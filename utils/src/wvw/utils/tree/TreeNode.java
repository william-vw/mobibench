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

package wvw.utils.tree;

import java.util.ArrayList;
import java.util.List;

import wvw.utils.tree.traversal.DFS;
import wvw.utils.tree.traversal.print.TreePrinter;

	
/**
 * @author wvw
 */

public class TreeNode {

	private String label;
	private List<TreeNode> children = new ArrayList<TreeNode>();

	public TreeNode(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void addChild(TreeNode child) {
		children.add(child);
	}

	public List<TreeNode> getChildren() {
		return children;
	}
	
	public String printTree() {
		TreePrinter printer = new TreePrinter();

		DFS dfs = new DFS();
		dfs.traverse(this, printer);

		return printer.getString();
	}
}
