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


public class TriplePat {

	private Term subject;
	private Term predicate;
	private Term object;

	public TriplePat(Term subject, Term predicate, Term object) {
		this.subject = subject;
		this.predicate = predicate;
		this.object = object;
	}

	public Term getSubject() {
		return subject;
	}

	public Term getPredicate() {
		return predicate;
	}

	public Term getObject() {
		return object;
	}

	public int hashCode() {
		return (normalize(subject)
				+ normalize(predicate)
				+ normalize(object)).hashCode();
	}

	private String normalize(Term term) {
		return term.toString();
	}

	public boolean equals(Object obj) {
		if (!(obj instanceof TriplePat))
			return false;

		TriplePat p2 = (TriplePat) obj;

		return p2.getSubject().matches(getSubject())
				&& p2.getPredicate().matches(getPredicate())
				&& p2.getObject().matches(getObject());
	}
}
