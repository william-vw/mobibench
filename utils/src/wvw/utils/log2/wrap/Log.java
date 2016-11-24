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

package wvw.utils.log2.wrap;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

public class Log {

	public static final int VERBOSE = 2;
	public static final int DEBUG = 3;
	public static final int INFO = 4;
	public static final int WARN = 5;
	public static final int ERROR = 6;
	public static final int ASSERT = 7;
	
	public static int v(String tag, String msg) {
		return wvw.utils.log2.Log.v(msg);
	}

	public static int v(String tag, String msg, Throwable tr) {
		return wvw.utils.log2.Log.v(msg, tr);
	}

	public static int d(String tag, String msg) {
		return wvw.utils.log2.Log.d(msg);
	}

	public static int d(String tag, String msg, Throwable tr) {
		return wvw.utils.log2.Log.d(msg, tr);
	}

	public static int i(String tag, String msg) {
		return wvw.utils.log2.Log.i(msg);
	}

	public static int i(String tag, String msg, Throwable tr) {
		return wvw.utils.log2.Log.i(msg, tr);
	}

	public static int w(String tag, String msg) {
		return wvw.utils.log2.Log.w(msg);
	}

	public static int w(String tag, Throwable tr) {
		return wvw.utils.log2.Log.w(tr);
	}

	public static int w(String tag, String msg, Throwable tr) {
		return wvw.utils.log2.Log.w(msg, tr);
	}

	public static int e(String tag, String msg) {
		return wvw.utils.log2.Log.e(msg);
	}

	public static int e(String tag, String msg, Throwable tr) {
		return wvw.utils.log2.Log.e(msg, tr);
	}

	public static int wtf(String tag, String msg) {
		return wvw.utils.log2.Log.e(msg);
	}

	public static int wtf(String tag, Throwable tr) {
		return wvw.utils.log2.Log.w(tr);
	}

	public static int wtf(String tag, String msg, Throwable tr) {
		return wvw.utils.log2.Log.e(msg, tr);
	}

	public static String getStackTraceString(Throwable tr) {
		ByteArrayOutputStream bOut = new ByteArrayOutputStream();
		tr.printStackTrace(new PrintStream(bOut));

		return new String(bOut.toByteArray());
	}

	public static boolean isLoggable(String tag, int level) {
		return wvw.utils.log2.Log.isLoggable(level);
	}

	public int println(int priority, String tag, String msg) {
		return wvw.utils.log2.Log.l(msg, priority);
	}

}
