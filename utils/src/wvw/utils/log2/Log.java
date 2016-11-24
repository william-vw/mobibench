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
	public static final int V = 2;
	public static final int D = 3;
	public static final int I = 4;
	public static final int W = 5;
	public static final int E = 6;
	public static final int A = 7;

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

	public static int getLevel() {
		return LVL;
	}

	public static boolean isLoggable(int lvl) {
		return lvl >= LVL;
	}

	public static int v(Object msg) {
		if (isLoggable(V))
			return target.v(tag, msg);
		
		return 0;
	}

	public static int v(Object msg, Throwable tr) {
		if (isLoggable(V))
			return target.v(tag, msg, tr);
		
		return 0;
	}

	public static int d(Object msg) {
		if (isLoggable(D))
			return target.d(tag, msg);
		
		return 0;
	}

	public static int d(Object msg, Throwable tr) {
		if (isLoggable(D))
			return target.d(tag, msg, tr);
		
		return 0;
	}

	public static int i(Object msg) {
		if (isLoggable(I))
			return target.i(tag, msg);
		
		return 0;
	}

	public static int i(Object msg, Throwable tr) {
		if (isLoggable(I))
			return target.i(tag, msg, tr);
		
		return 0;
	}

	public static int w(Object msg) {
		if (isLoggable(W))
			return target.w(tag, msg);
		
		return 0;
	}

	public static int w(Throwable tr) {
		if (isLoggable(W))
			return target.w(tag, tr);
		
		return 0;
	}

	public static int w(Object msg, Throwable tr) {
		if (isLoggable(W))
			return target.w(tag, msg, tr);
		
		return 0;
	}

	public static int e(Object msg) {
		if (isLoggable(E))
			return target.e(tag, msg);
		
		return 0;
	}

	public static int e(Object msg, Throwable tr) {
		if (isLoggable(E))
			return target.e(tag, msg, tr);
		
		return 0;
	}

	public static int l(Object msg, int lvl) {
		if (isLoggable(lvl))
			return target.l(tag, msg);
		
		return 0;
	}

	public static int l(Object msg, Exception e, int lvl) {
		if (isLoggable(lvl))
			return target.l(tag, msg, e);
		
		return 0;
	}
}
