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

public class NullIfEmptyIterator<T> implements Iterator<T> {

	private int cur = -1;
	private T[] elements;

	public NullIfEmptyIterator(T[] elements) {
		this.elements = elements;
	}
	
	@SuppressWarnings("unchecked")
	public NullIfEmptyIterator(List<T> elements) {
		this.elements = (T[]) elements.toArray();
	}

	public boolean hasNext() {
		if (cur == -1 && elements.length == 0)
			return true;
		
		return ++cur < elements.length;
	}

	public T next() {
		if (cur == -1) {
			cur = 0;
			
			return null;
		}
		
		return elements[cur];
	}

	public static void main(String[] args) throws Exception {
		Iterator<String> it = new NullIfEmptyIterator<String>(new String[] { "a", "b", "c" });
		
		while (it.hasNext()) {
			System.out.println(it.next());
		}
	}
	
	public void remove() {		
		System.err.println("unsupported method: remove");
	}
}
