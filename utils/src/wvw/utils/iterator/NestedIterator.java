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

@SuppressWarnings("unchecked")
public class NestedIterator<T> implements Iterator<T> {

	private int curIdx = 0;
	private Iterator<T>[] iterators;

	public NestedIterator(Iterator<T>... iterators) {
		this.iterators = iterators;
	}

	public boolean hasNext() {
		if (curIdx < iterators.length) {

			if (iterators[curIdx].hasNext())
				return true;

			else {
				curIdx++;
				
				return hasNext();
			}

		} else
			return false;
	}

	public T next() {
		return iterators[curIdx].next();
	}
	
	public void remove() {		
		System.err.println("unsupported method: remove");
	}
}
