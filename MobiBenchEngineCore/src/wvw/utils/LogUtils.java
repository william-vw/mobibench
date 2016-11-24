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

import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.DecimalFormat;

public class LogUtils {

	public static String toString(long[] array) {
		String str = "[ ";
		
		for (int i = 0; i < array.length; i++) {
			if (i > 0)
				str += ", ";
			
			str += array[i];
		}
		
		str += " ]";
		
		return str;
	}
	
	public static String toString(String[] array, String separator, String quote) {
		String str = "";
		
		for (int i = 0; i < array.length; i++) {
			if (i > 0)
				str += separator;
				
			String el = array[i];
			if (quote != null)
				el = quote + el + quote;
			
			str += el;
		}
		
		return str;
	}
	
	public static String toString(Exception e) {
		String str = "\nERROR: \n[" + e.getClass() + "]: " 
				+ e.getMessage() + "\n";
		
		StringWriter errWriter = new StringWriter();
		e.printStackTrace(new PrintWriter(errWriter));
		
		str += "STACK TRACE: \n" + errWriter.toString() + "\n";
		
		return str;
	}
	
	public static double toDecimals(double d, int nrDecs) {
		String format = "#.";
		while (nrDecs-- > 0)
			format += "#";

		DecimalFormat decForm = new DecimalFormat(format);

		return Double.valueOf(decForm.format(d));
	}
}
