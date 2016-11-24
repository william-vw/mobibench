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

package wvw.utils.log2;

import wvw.utils.log2.target.LogTarget;

public class Log {

	private static String tag;
	private static LogTarget target;

	public static final int NO_LOG = -1;
	public static final int D = 0;
	public static final int V = 1;
	public static final int I = 2;
	public static final int W = 3;
	public static final int E = 4;

	private static int LVL = D;
	public static final int OFF = 255;

	public static void setTag(String tag) {
		Log.tag = tag;
	}

	public static void setTarget(LogTarget target) {
		Log.target = target;
	}
	
	public static LogTarget getTarget() {
		return target;
	}

	public static void setLevel(int lvl) {
		Log.LVL = lvl;
	}

	public static void d(Object msg) {
		if (D >= LVL)
			target.d(tag, msg);
	}

	public static void v(Object msg) {
		if (V >= LVL)
			target.v(tag, msg);
	}

	public static void i(Object msg) {
		if (I >= LVL)
			target.i(tag, msg);
	}

	public static void w(Object msg) {
		if (W >= LVL)
			target.w(tag, msg);
	}

	public static void e(Object msg) {
		if (E >= LVL)
			target.e(tag, msg);
	}

	public static void e(Object msg, Exception e) {
		if (E >= LVL)
			target.e(tag, msg, e);
	}

	public static void l(Object msg, int lvl) {
		if (lvl >= LVL)
			target.l(tag, msg);
	}

	public static void l(Object msg, Exception e, int lvl) {
		if (lvl >= LVL)
			target.l(tag, msg, e);
	}
}
