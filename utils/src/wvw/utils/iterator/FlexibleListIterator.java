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

import java.util.List;

/**
 * @author wvw
 */

public class FlexibleListIterator<T> implements FlexibleIterator<T> {

	private int idx = 0;
	private List<T> list;

	public FlexibleListIterator(List<T> list) {
		this.list = list;
	}

	public boolean hasNext() {
		return idx < list.size();
	}

	public T next() {
		return list.get(idx++);
	}
	
	public void startAt(int idx) {
		if (list.size() < idx)
			this.idx = idx;
	}
	
	public T getAt(int idx) {
		if (idx < list.size())
			return list.get(idx);
		
		return null;
	}

	public void reset() {
		idx = 0;
	}
	
	public int size() {
		return list.size();
	}
	
	public void remove() {		
		System.err.println("unsupported method: remove");
	}
}
