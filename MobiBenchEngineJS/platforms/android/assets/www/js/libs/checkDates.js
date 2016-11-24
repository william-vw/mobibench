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

// (test code)

function checkDates() {
	var timestamps = [];
	
	var dateProperty = "<http://www.dal.ca/nichegroup/impactaf#hasDate>";
	
	dataSet = "res/data/final_full.nt";
	triples = retrieveTriples();
	
	for (var i = 0; i < triples.length; i++) {
		var triple = triples[i];
		
		var idx = triple.indexOf(dateProperty);
		if (idx > 0) {
			var datedRes = triple.substring(0, idx).trim();
			datedRes = datedRes.substring(1, datedRes.length - 1);
			
			var dateStr = triple.substring(idx + dateProperty.length).trim();
			dateStr = dateStr.substring(1, dateStr.indexOf("^") - 1);
			
			var mmt = moment(dateStr, "YYYY-MM-DDThh:mm:ssZ");
// 			dateStr = mmt.format("YYYY-MM-DDThh:mm:ssZ");
			
			timestamps.push([ datedRes, mmt.valueOf() ]);
		}
	}
	
	timestamps.sort(function(cell1, cell2) {
		if (cell1[0] < cell2[0])
			return -1;
		
		if (cell1[0] > cell2[0])
			return 1;
		
		return 0;
	});
	
	var output = "";
	for (var i = 0; i < timestamps.length; i++) {
		var timestamp = timestamps[i];
		
		output += timestamp[0] + " - " + timestamp[1] + "\n";
	}
	
	doLog(output);
}

function retrieveTriples() {
	time_retrieveTriples = 0;

	var start = Date.now();

	var triples = retrieveResource(dataSet);

	var error = false;
	if (triples == null) {
		doLog("Error retrieving triples");

		error = true;

	} else if (triples == "") {
		doLog("No triples found in file.");

		error = true;
	}

	if (error)
		return [];

	triples = triples.split("\n");
	for (var i = 0; i < triples.length; i++)

		if (triples[i] == "")
			triples.splice(i--, 1);

	var end = Date.now();

	time_retrieveTriples = (end - start);

	return triples;
}
