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

public class CmdOptionVal {

	private String name;
	private Object value;

	private CmdOption option;

	public CmdOptionVal(String name, Object value) {
		this.name = name;
		this.value = value;
	}
	
	public CmdOptionVal(String name, Object value, CmdOption option) {
		this.name = name;
		this.value = value;
		
		this.option = option;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public CmdOption getOption() {
		return option;
	}

	public void setOption(CmdOption option) {
		this.option = option;
	}

}
