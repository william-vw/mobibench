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
package wvw.utils.cmd;

import wvw.utils.StringUtils;

public class CmdOption {

	private String name;
	private String description;

	private boolean isReq = false;
	private OptionDependency[] dependencies;

	private boolean hasArg = false;
	@SuppressWarnings("rawtypes")
	private Class argClz = null;

	private Object defualt;
	private String[] options;

	public CmdOption(String name, String description) {
		this.name = name;

		this.description = description;
	}

	public CmdOption(String name, String description, String defualt) {
		this.name = name;
		this.description = description;

		this.defualt = defualt;
		this.hasArg = true;
	}

	public CmdOption(String name, String description, boolean isReq) {
		this.name = name;
		this.description = description;

		this.isReq = isReq;
	}

	public CmdOption(String name, String description, String[] options, boolean isReq) {
		this.name = name;
		this.description = description;

		this.options = options;
		this.isReq = isReq;
		
		this.hasArg = true;
	}

	public CmdOption(String name, String description,
			OptionDependency... dependencies) {

		this.name = name;
		this.description = description;

		this.dependencies = dependencies;
	}

	public CmdOption(String name, String description, String[] options,
			OptionDependency... dependencies) {

		this.name = name;
		this.description = description;

		this.options = options;
		this.dependencies = dependencies;
		
		this.hasArg = true;
	}

	public CmdOption(String name, String description, boolean hasArg, boolean isReq) {
		this.name = name;
		this.description = description;

		this.hasArg = hasArg;
		this.isReq = isReq;
	}

	public CmdOption(String name, String description, boolean hasArg,
			OptionDependency... dependencies) {

		this.name = name;
		this.description = description;

		this.hasArg = hasArg;
		this.dependencies = dependencies;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		String ret = description;

		if (options != null)
			ret += "\n(options: "
					+ StringUtils.toString(options, " | ", "", "") + ")";

		if (defualt != null)
			ret += "\n(default: " + defualt + ")";

		if (isReq)
			ret += "\n<required>";

		if (hasArgClz())
			ret += "\n[" + getArgClzName() + "]";

		return ret;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isReq() {
		return isReq;
	}

	public void setReq(boolean isReq) {
		this.isReq = isReq;
	}

	public boolean hasDependencies() {
		return dependencies != null;
	}

	public OptionDependency[] getDependencies() {
		return dependencies;
	}

	public void setDependencies(OptionDependency[] dependencies) {
		this.dependencies = dependencies;
	}

	public boolean hasArg() {
		return hasArg;
	}

	public void setHasArg(boolean hasArg) {
		this.hasArg = hasArg;
	}

	@SuppressWarnings("rawtypes")
	public Class getArgClz() {
		return argClz;
	}

	@SuppressWarnings("rawtypes")
	public void setArgClz(Class argClz) {
		this.argClz = argClz;
	}

	public boolean hasArgClz() {
		return this.argClz != null;
	}

	public String getArgClzName() {
		return this.argClz.getSimpleName().toLowerCase();
	}

	public Object getDefualt() {
		return defualt;
	}

	public void setDefualt(Object defualt) {
		this.defualt = defualt;
	}

	public String[] getOptions() {
		return options;
	}

	public void setOptions(String[] options) {
		this.options = options;
	}

	public boolean isHasArg() {
		return hasArg;
	}
}
