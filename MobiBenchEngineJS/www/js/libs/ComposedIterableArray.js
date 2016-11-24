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

function ComposedIterableArray(array, getArrayFn, genEntryFn, addEntryFn) {
	this.idx = 0;
	this.len = -1;

	this.array = array;

	this.getArrayFn = getArrayFn;
	this.genEntryFn = genEntryFn;
	this.addEntryFn = addEntryFn;

	this.nested = false;
	this.curIdxs = new Array(array.length);

	for (var i = 0; i < array.length; i++) {
		var el = array[i];

		if (typeof el == 'object')
			el = getArrayFn(el);

		if (Array.isArray(el)) {
			this.nested = true;

			this.curIdxs[i] = 0;

			if (el.length > this.len)
				this.len = el.length;
		}
	}

	if (this.len == -1)
		this.len = array.length;

	this.hasNext = function() {		
		return this.idx < this.len;
	}

	this.next = function() {
		if (!this.nested)
			return this.array[this.idx++];

		else {
			var entry = this.genEntryFn();

			for (var i = 0; i < this.array.length; i++) {
				var el = this.array[i], orEl = el;

				var value = null;
				if (typeof el == 'object')
					el = this.getArrayFn(el);

				if (Array.isArray(el)) {

					if (this.curIdxs[i] < el.length)
						value = el[this.curIdxs[i]++];

					else {
						var prevIdx = this.curIdxs[i] - 1;

						if (prevIdx >= 0)
							value = el[prevIdx];
					}
				} else
					value = el;

				if (value != null)
					this.addEntryFn(orEl, value, entry);
			}

			this.idx++;

			return entry;
		}
	}
}
