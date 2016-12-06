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

package wvw.mobibench.service.preproc;

import java.util.List;

import wvw.utils.rule.RuleWrapper;
import wvw.utils.rule.RulesUtils;

public class PreProcessConfig {

	private Ontology ontology;
	private String rules;
	
	private Options options;

	public PreProcessConfig() {
	}

	public Ontology getOntology() {
		return ontology;
	}

	public void setOntology(Ontology ontology) {
		this.ontology = ontology;
	}

	public String getRules() {
		return rules;
	}

	public List<RuleWrapper> getRuleObjs() {
		return RulesUtils.splitRules(rules);
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	public Options getOptions() {
		return options;
	}

	public void setOptions(Options options) {
		this.options = options;
	}

	public class Ontology {

		private String path;

		private String content;
		private String syntax;

		public Ontology(String path, String contents, String syntax) {
			this.path = path;

			this.content = contents;
			this.syntax = syntax;
		}

		public String getPath() {
			return path;
		}

		public void setPath(String path) {
			this.path = path;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getSyntax() {
			return syntax;
		}

		public void setSyntax(String syntax) {
			this.syntax = syntax;
		}
	}

	public class Options {

		private boolean outputRules;
		private String outputPath;

		public Options(boolean outputRules, String outputPath) {
			this.outputRules = outputRules;
			this.outputPath = outputPath;
		}

		public boolean isOutputRules() {
			return outputRules;
		}

		public void setOutputRules(boolean outputRules) {
			this.outputRules = outputRules;
		}

		public String getOutputPath() {
			return outputPath;
		}

		public void setOutputPath(String outputPath) {
			this.outputPath = outputPath;
		}

	}
}
