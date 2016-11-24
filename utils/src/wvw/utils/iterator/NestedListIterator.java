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

package wvw.utils.iterator;

import java.util.Iterator;
import java.util.List;

public class NestedListIterator<K> implements FlexibleIterator<K> {

	private List<K>[] lists;
	private int curIdx = -1;

	private Iterator<K> curIt;

	@SafeVarargs
	public NestedListIterator(List<K>... lists) {
		this.lists = lists;
	}

	public boolean hasNext() {
		if (curIt == null || !curIt.hasNext()) {

			if (curIdx + 1 < lists.length) {
				List<K> next = lists[++curIdx];

				if (next != null)
					curIt = next.iterator();

				return hasNext();

			} else
				return false;

		} else
			return true;
	}

	public K next() {
		return curIt.next();
	}

	public void reset() {
		curIdx = 0;

		curIt = null;
	}

	public void startAt(int idx) {
		System.err.println("unsupported method: startAt");		
	}

	public K getAt(int idx) {
		System.err.println("unsupported method: getAt");
		
		return null;
	}
	
	public int size() {
		return lists.length;
	}
	
	public void remove() {		
		System.err.println("unsupported method: remove");
	}
}
