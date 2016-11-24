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

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/**
 * @author wvw
 */

public class NestedCollectionIterator<K> implements FlexibleIterator<K> {

	private Collection<List<K>> lists;
	private Iterator<List<K>> listIt;

	private Iterator<K> curIt;

	public NestedCollectionIterator(Collection<List<K>> lists) {
		this.lists = lists;

		listIt = lists.iterator();
	}

	public boolean hasNext() {
		if (curIt == null || !curIt.hasNext()) {

			if (listIt.hasNext()) {
				curIt = listIt.next().iterator();

				return hasNext();

			} else
				return false;

		} else
			return true;
	}

	public K next() {
		if (curIt == null)
			curIt = listIt.next().iterator();

		return curIt.next();
	}

	public void reset() {
		listIt = lists.iterator();

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
		return lists.size();
	}
	
	public void remove() {		
		System.err.println("unsupported method: remove");
	}
}
