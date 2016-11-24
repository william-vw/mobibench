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

package wvw.mobibench.service.select.domain;

import wvw.mobibench.service.select.SelectConfig;

public class DomainBasedSelectConfig implements SelectConfig {

	private String rules;

	private String axioms;
	private String ontology;
	private String syntax;

	private String targetInf;

	private DomainSelectTypes type;

	public DomainBasedSelectConfig() {
	}

	public DomainBasedSelectConfig(String rules, String axioms, String ontology,
			String syntax, String targetInf, DomainSelectTypes type) {

		this.rules = rules;

		this.axioms = axioms;
		this.ontology = ontology;
		this.syntax = syntax;

		this.targetInf = targetInf;

		this.type = type;
	}

	public String getRules() {
		return rules;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	public String getAxioms() {
		return axioms;
	}

	public void setAxioms(String axioms) {
		this.axioms = axioms;
	}

	public String getOntology() {
		return ontology;
	}

	public void setOntology(String ontology) {
		this.ontology = ontology;
	}

	public String getSyntax() {
		return syntax;
	}

	public void setSyntax(String syntax) {
		this.syntax = syntax;
	}

	public boolean hasTargetInf() {
		return targetInf != null;
	}

	public String getTargetInf() {
		return targetInf;
	}

	public void setTargetInf(String targetInf) {
		this.targetInf = targetInf;
	}

	public void setType(DomainSelectTypes type) {
		this.type = type;
	}

	public DomainSelectTypes getType() {
		return type;
	}

	public String toString() {
		return "selection type: " + type;
	}
}
