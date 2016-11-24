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

package wvw.mobibench.service.select.domain.rule.struct.tp;

import wvw.utils.rdf.NS;

public class Res extends Val {

	private String uri;
	private String type;

	public Res(String uri) {
		super(ValueTypes.RESOURCE);

		this.uri = uri;
	}

	public Res(String uri, String type) {
		super(ValueTypes.RESOURCE);

		this.uri = uri;
		this.type = type;
	}

	public String getStr() {
		return uri;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getUriType() {
		return type;
	}

	public void setUriType(String type) {
		this.type = type;
	}

	public boolean equals(Res prop, Object obj, boolean strict) {
		if (obj instanceof Res) {
			Res res2 = (Res) obj;

			if (strict) {
				if (uri == null || res2.uri == null)
					return false;
				else
					return uri.equals(res2.uri);

			} else {
				System.err.println("Res: only strict comparisons supported");
				
				return false;
			}

			// OntologyManager ontoMan = OntologyManager.getInstance();
			// if (uri == null || res2.uri == null) {
			//
			// if (type == null || res2.type == null)
			// return false;
			//
			// // return type.equals(res2.type);
			// return ontoMan.isSubclassOf(type, res2.type);
			//
			// } else {
			// if (prop != null && prop.getUri().equals(RdfNS.TYPE))
			// return ontoMan.isSubclassOf(uri, res2.uri);
			// else
			// return uri.equals(res2.uri);
			// }

		} else
			return false;
	}

	public String toString() {
		String str = "";

		if (uri != null)
			str += NS.collapse(uri);

		if (type != null)
			str += " (a " + NS.collapse(type) + ")";

		str = str.trim();

		return str;
	}
}
