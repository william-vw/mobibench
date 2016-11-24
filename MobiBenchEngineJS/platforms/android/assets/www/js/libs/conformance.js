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

function checkOverlaps(set1, set2) {
	var noOverlaps = [];

	for ( var idx1 in set1) {
		var el1 = set1[idx1];

		var found = false;
		for ( var idx2 in set2) {
			var el2 = set2[idx2];

			if (el1 == el2) {
				found = true;

				break;
			}
		}

		if (!found)
			noOverlaps.push(el1);
	}

	return noOverlaps;
}
