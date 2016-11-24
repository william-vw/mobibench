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

package wvw.mobibench.service.select.def;

import java.util.ArrayList;
import java.util.List;

import wvw.mobibench.service.convert.ConvertConfig;
import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.spin.sel.SPIN2AddedRule;
import wvw.mobibench.service.convert.spin.sel.SPIN2ReplacementRule;
import wvw.utils.SplitUtils;

public class Selection {

	private String addedAxioms;
	private String relevantAxioms;

	private List<AddedRule> addedRules;
	private List<RemovedRule> removedRules;
	private List<ReplacementRule> replacementRules;

	public Selection() {
	}

	public Selection(InitSelection initSel) {
		setAddedAxioms(initSel.getAddedAxioms());
		setRelevantAxioms(initSel.getRelevantAxioms());

		setAddedRules(initSel.getAddedRules());
		setRemovedRules(initSel.getRemovedRules());
		setReplacementRules(initSel.getReplacementRules());
	}

	public boolean hasAddedAxioms() {
		return addedAxioms != null;
	}

	public String getAddedAxioms() {
		return addedAxioms;
	}

	public void setAddedAxioms(String addedAxioms) {
		this.addedAxioms = addedAxioms;
	}

	public boolean hasRelevantAxioms() {
		return relevantAxioms != null;
	}

	public String getRelevantAxioms() {
		return relevantAxioms;
	}

	public void setRelevantAxioms(String relevantAxioms) {
		this.relevantAxioms = relevantAxioms;
	}

	public boolean hasAddedRules() {
		return addedRules != null;
	}

	public List<AddedRule> getAddedRules() {
		return addedRules;
	}

	public void setAddedRules(String addedRules) {
		if (addedRules != null)
			this.addedRules = parseAddedRules(addedRules);
	}

	public boolean hasRemovedRules() {
		return removedRules != null;
	}

	public List<RemovedRule> getRemovedRules() {
		return removedRules;
	}

	public void setRemovedRules(String removedRules) {
		if (removedRules != null)
			this.removedRules = parseRemovedRules(removedRules);
	}

	public boolean hasReplacementRules() {
		return replacementRules != null;
	}

	public List<ReplacementRule> getReplacementRules() {
		return replacementRules;
	}

	public void setReplacementRules(String replacementRules) {
		if (replacementRules != null)
			this.replacementRules = parseReplacementRules(replacementRules);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<AddedRule> parseAddedRules(String rules) {
		try {
			SPIN2AddedRule conv = new SPIN2AddedRule();
			List<AddedRule> result = (List) conv.convertRules(rules,
					new ConvertConfig(false));

			return result;

		} catch (ConvertException e) {
			e.printStackTrace();

			return null;
		}
	}

	private List<RemovedRule> parseRemovedRules(String changes) {
		String[] ids = SplitUtils.splitOnNewline(changes);

		List<RemovedRule> removeds = new ArrayList<RemovedRule>();
		for (String id : ids)
			removeds.add(new RemovedRule(id));

		return removeds;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<ReplacementRule> parseReplacementRules(String rules) {
		try {
			SPIN2ReplacementRule conv = new SPIN2ReplacementRule();
			List<ReplacementRule> result = (List) conv.convertRules(rules,
					new ConvertConfig(false));

			return result;

		} catch (ConvertException e) {
			e.printStackTrace();

			return null;
		}
	}

	public String toString() {
		return "< addedAxioms: " + addedAxioms + "; relevantAxioms: "
				+ relevantAxioms + "; removedRules: " + removedRules
				+ "; replacementRules: " + replacementRules + " >";
	}

	public class InitSelection {

		private String addedAxioms;
		private String relevantAxioms;

		private String addedRules;
		private String removedRules;
		private String replacementRules;

		public InitSelection() {
		}

		public InitSelection(String addedAxioms, String relevantAxioms,
				String addedRules, String removedRules,
				String replacementRules) {

			this.addedAxioms = addedAxioms;
			this.relevantAxioms = relevantAxioms;
			this.addedRules = addedRules;
			this.removedRules = removedRules;
			this.replacementRules = replacementRules;
		}

		public String getAddedAxioms() {
			return addedAxioms;
		}

		public void setAddedAxioms(String addedAxioms) {
			this.addedAxioms = addedAxioms;
		}

		public String getRelevantAxioms() {
			return relevantAxioms;
		}

		public void setRelevantAxioms(String relevantAxioms) {
			this.relevantAxioms = relevantAxioms;
		}

		public String getAddedRules() {
			return addedRules;
		}

		public void setAddedRules(String addedRules) {
			this.addedRules = addedRules;
		}

		public String getRemovedRules() {
			return removedRules;
		}

		public void setRemovedRules(String removedRules) {
			this.removedRules = removedRules;
		}

		public String getReplacementRules() {
			return replacementRules;
		}

		public void setReplacementRules(String replacementRules) {
			this.replacementRules = replacementRules;
		}
	}
}