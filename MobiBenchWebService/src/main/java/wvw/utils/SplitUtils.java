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

package wvw.utils;

public class SplitUtils {

	public static String[] splitOnNewline(String str) {
		String sep = null;
		if (str.contains("\r\n"))
			sep = "\r\n";
		else
			sep = "\n";
		
		return str.split(sep);
	}
	
	public static String[] splitOnDoubleNewline(String str) {
		String sep = null;
		if (str.contains("\r\n\r\n"))
			sep = "\r\n\r\n";
		else
			sep = "\n\n";
		
		return str.split(sep);
	}
}
