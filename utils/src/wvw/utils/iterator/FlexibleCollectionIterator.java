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

/**
 * @author wvw
 */

public class FlexibleCollectionIterator<T> implements FlexibleIterator<T> {

	private Collection<T> coll;
	private Iterator<T> collIt;

	public FlexibleCollectionIterator(Collection<T> coll) {
		this.coll = coll;

		collIt = coll.iterator();
	}

	public boolean hasNext() {
		return collIt.hasNext();
	}

	public T next() {
		return collIt.next();
	}

	public void reset() {
		collIt = coll.iterator();
	}

	public void startAt(int idx) {
		System.err.println("unsupported method: startAt");
	}

	public T getAt(int idx) {
		System.err.println("unsupported method: getAt");

		return null;
	}

	public int size() {
		return coll.size();
	}

	public void remove() {
		System.err.println("unsupported method: remove");
	}
}
