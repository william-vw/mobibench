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

package wvw.utils.log2.format;

public class DefaultFormatter implements Formatter {

	public String format(String msg) {
		return msg;
	}

	public String format(Object obj) {
		return obj.toString();
	}

	public String format(Throwable tr) {
		return "(" + tr.getClass() + ") " + tr.getMessage();
	}

	public String format(String ID, String msg) {
		return ID + ": " + msg;
	}

	public String format(Object obj, String msg) {
		return "[" + obj.getClass() + "]: " + msg;
	}

	public String format(Object obj, Throwable tr) {
		return "[" + obj.getClass() + "] Exception: (" + tr.getClass() + ") " + tr.getMessage();
	}

	public String format(Object obj, String msg, Throwable tr) {
		return "[" + obj.getClass() + "]: " + msg + "; " + "Exception: (" + tr.getClass() + ") " + tr.getMessage();
	}
}
