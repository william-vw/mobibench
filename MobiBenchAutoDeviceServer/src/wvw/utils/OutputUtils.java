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

import java.util.List;
import java.util.Map;

/**
 * 
 * @author wvw
 */

public class OutputUtils {

	public static String toString(Exception e) {
		return "[" + e.getClass() + "] " + e.getMessage();
	}

	@SuppressWarnings("rawtypes")
	public static String valuesToString(Map map) {
		return map.values().toString();
	}

	@SuppressWarnings("rawtypes")
	public static String keysToString(Map map) {
		return map.keySet().toString();
	}

	public static String toString(String[] strs) {
		StringBuffer b = new StringBuffer();

		for (int i = 0; i < strs.length; i++) {
			if (i > 0)
				b.append(", ");

			b.append(strs[i]);
		}

		return "[" + b.toString() + "]";
	}

	public static String toString(List<String> strs, String sep) {
		StringBuffer b = new StringBuffer();

		for (int i = 0; i < strs.size(); i++) {
			if (i > 0)
				b.append(sep);
			
			b.append(strs.get(i));
		}

		return b.toString();
	}
}
