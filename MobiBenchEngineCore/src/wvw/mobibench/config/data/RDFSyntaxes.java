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
package wvw.mobibench.config.data;

import wvw.utils.EnumUtils;

public enum RDFSyntaxes {

	RDF_XML("RDF/XML"), N_Triple("N-TRIPLE"), Turtle("TURTLE"), TTL("TTL"), N3(
			"N3"), RDF_XML_ABBREV("RDF/XML-ABBREV");

	private String label;

	private RDFSyntaxes(String label) {
		this.label = label;
	}

	public String toString() {
		return label;
	}

	public int getId() {
		return ordinal();
	}

	public String getLabel() {
		return EnumUtils.getLabel(this);
	}

	public static RDFSyntaxes getEnum(String label) {
		return (RDFSyntaxes) EnumUtils.getEnum(values(), label);
	}

	public static RDFSyntaxes getEnum(int id) {
		return (RDFSyntaxes) EnumUtils.getEnum(values(), id);
	}
}
