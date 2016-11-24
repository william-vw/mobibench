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

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author wvw
 */

public class StringUtils {

	public static boolean isNumber(String str) {
		return str.matches("-?\\d+(\\.\\d+)?");
	}

	public static InputStream toStream(String str) {
		return new ByteArrayInputStream(str.getBytes());
	}

	public static String genSpaces(int len) {
		return genChars(len, " ");
	}

	public static String genTabs(int len) {
		return genChars(len, "\t");
	}

	public static String genChars(int len, String chr) {
		StringBuffer buffer = new StringBuffer();
		while (len-- > 0)
			buffer.append(chr);

		return buffer.toString();
	}

	@SuppressWarnings("rawtypes")
	public static String toString(List list, String sep) {
		return toString(list, sep, null, null, null);
	}

	@SuppressWarnings("rawtypes")
	public static String toString(List list, String atomPar, String sep) {
		return toString(list, sep, atomPar, null, null);
	}

	@SuppressWarnings("rawtypes")
	public static String toString(List list, String sep, String lstPar1, String lstPar2) {
		return toString(list, sep, null, lstPar1, lstPar2);
	}

	@SuppressWarnings("rawtypes")
	public static String toString(List list, String sep, String atomPar, String lstPar1,
			String lstPar2) {

		StringBuffer buffer = new StringBuffer();
		if (lstPar1 != null)
			buffer.append(lstPar1);

		for (int i = 0; i < list.size(); i++) {
			if (i > 0)
				buffer.append(sep);

			if (atomPar != null)
				buffer.append(atomPar);

			buffer.append(list.get(i));

			if (atomPar != null)
				buffer.append(atomPar);
		}

		if (lstPar2 != null)
			buffer.append(lstPar2);

		return buffer.toString();
	}

	public static String toString(Exception e) {
		return "[" + e.getClass() + "] " + e.getMessage();
	}

	public static String toString(String[] strs) {
		return toString(strs, ", ", "[ ", " ]");
	}

	public static String toString(String[] strs, String sep, String par1,
			String par2) {

		String ret = "";
		for (String str : strs)
			ret += sep + str;

		return par1 + ret.substring(2) + par2;
	}

	public static String toString(Object[] objs) {
		String ret = "";
		for (Object obj : objs)
			ret += ", " + obj.toString();

		return "[ " + ret.substring(2) + " ]";
	}

	@SuppressWarnings("rawtypes")
	public static String valuesToString(Map map) {
		return map.values().toString();
	}

	@SuppressWarnings("rawtypes")
	public static String keysToString(Map map) {
		return map.keySet().toString();
	}
}
