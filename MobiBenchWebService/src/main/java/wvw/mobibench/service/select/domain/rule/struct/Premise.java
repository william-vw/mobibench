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

package wvw.mobibench.service.select.domain.rule.struct;

import wvw.mobibench.service.select.domain.rule.struct.tp.Term;
import wvw.mobibench.service.select.domain.rule.struct.tp.TriplePat;

public class Premise {

	private TriplePat triple;

	public Premise(TriplePat triple) {
		this.triple = triple;
	}

	public TriplePat getTriple() {
		return triple;
	}

	public void setTriple(TriplePat triple) {
		this.triple = triple;
	}

	public int hashCode() {
		return (normalize(triple.getSubject())
				+ normalize(triple.getPredicate())
				+ normalize(triple.getObject())).hashCode();
	}

	private String normalize(Term node) {
		return node.toString();
	}

	public boolean equals(Object obj) {
		if (!(obj instanceof Premise))
			return false;

		Premise p2 = (Premise) obj;

		return triple.getSubject().equals(p2.triple.getSubject())
				&& triple.getPredicate().equals(p2.triple.getPredicate())
				&& triple.getObject().equals(p2.triple.getObject());
	}
}
