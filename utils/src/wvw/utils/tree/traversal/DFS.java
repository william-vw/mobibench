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

package wvw.utils.tree.traversal;

import java.util.HashMap;
import java.util.Map;

import wvw.utils.tree.TreeNode;

/**
 * @author wvw
 */

public class DFS implements TreeTraversal {

	private Map<TreeNode, Boolean> visited = new HashMap<TreeNode, Boolean>();

	private TraversalListener listener;

	public void traverse(TreeNode root, TraversalListener listener) {
		this.listener = listener;

		listener.rootDiscovered(root);
		traverse(root);
		listener.rootProcessed(root);
	}

	private void traverse(TreeNode node) {
		if (visited.containsKey(node))
			return;

		visited.put(node, true);

		listener.nodeDiscovered(node);

		for (TreeNode child : node.getChildren())
			traverse(child);

		listener.nodeProcessed(node);
	}
}
