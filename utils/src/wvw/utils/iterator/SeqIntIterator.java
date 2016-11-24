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

public class SeqIntIterator implements FlexibleIterator<Integer> {

	private int cur = 0;
	private int limit = 0;

	public SeqIntIterator(int limit) {
		this.limit = limit;
	}

	public boolean hasNext() {
		return cur < limit;
	}

	public Integer next() {
		return cur++;
	}

	public void reset() {
		cur = 0;
	}

	public void startAt(int idx) {
		if (idx < limit)
			cur = idx;
	}

	public Integer getAt(int idx) {
		if (idx < limit)
			return idx;
		else
			return null;
	}

	public int size() {
		return limit;
	}
	
	public void remove() {		
		System.err.println("unsupported method: remove");
	}
}
