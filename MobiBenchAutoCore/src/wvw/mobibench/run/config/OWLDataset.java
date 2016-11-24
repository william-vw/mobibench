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
package wvw.mobibench.run.config;

import java.util.ArrayList;
import java.util.List;

public class OWLDataset {

	private String dataset;
	private String subset;

	private List<String> files = new ArrayList<String>();

	public OWLDataset(String dataset) {
		this.dataset = dataset;
	}

	public OWLDataset(String dataset, String subset) {
		this.dataset = dataset;

		this.subset = subset;
	}

	public OWLDataset(String dataset, Integer[] versions) {
		this.dataset = dataset;

		for (Integer version : versions)
			this.files.add(String.valueOf(version));
	}

	public OWLDataset(String dataset, String subset, Integer[] versions) {
		this(dataset, versions);

		this.subset = subset;
	}
	
	public OWLDataset(String dataset, String[] files) {
		this(dataset);
		
		for (String file : files)
			this.files.add(file);
	}
	
	public OWLDataset(String dataset, String subset, String[] files) {
		this(dataset, subset);
		
		for (String file : files)
			this.files.add(file);
	}

	public OWLDataset(String dataset, int from, int to) {
		this.dataset = dataset;

		for (int i = from; i <= to; i++)
			this.files.add(String.valueOf(i));
	}

	public OWLDataset(String dataset, String subset, int from, int to) {
		this(dataset, from, to);

		this.subset = subset;
	}

	public String getDataset() {
		return dataset;
	}

	public void setDataset(String dataset) {
		this.dataset = dataset;
	}

	public boolean hasSubset() {
		return subset != null;
	}

	public String getSubset() {
		return subset;
	}

	public void setSubset(String subset) {
		this.subset = subset;
	}

	public boolean hasFiles() {
		return !files.isEmpty();
	}

	public List<String> getFiles() {
		return files;
	}

	public void setVersions(Integer... versions) {
		for (Integer version : versions)
			this.files.add(String.valueOf(version));
	}

	public String getDataPath() {
		return dataset + (hasSubset() ? "/" + subset : "");
	}

	public String toString() {
		return dataset + (hasSubset() ? "_" + subset : "");
	}
}
