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
import java.util.Arrays;
import java.util.List;

public class OWLScope {

	private String scope;

	private List<String> options = new ArrayList<String>();

	public OWLScope(String scope) {
		this.scope = scope;
	}
	
	public OWLScope(String scope, String[] options) {
		this.scope = scope;

		this.options.addAll(Arrays.asList(options));
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public boolean hasOptions() {
		return !options.isEmpty();
	}
	
	public List<String> getOptions() {
		return options;
	}

	public void setOptions(String... options) {
		this.options.addAll(Arrays.asList(options));
	}
	
	public String toString() {
		return scope;
	}

}
