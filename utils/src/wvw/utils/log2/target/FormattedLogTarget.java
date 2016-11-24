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

package wvw.utils.log2.target;

import wvw.utils.log2.format.DefaultFormatter;
import wvw.utils.log2.format.Formatter;

public abstract class FormattedLogTarget implements LogTarget {

	private Formatter formatter;

	public FormattedLogTarget() {
		this.formatter = new DefaultFormatter();
	}

	public FormattedLogTarget(Formatter formatter) {
		this.formatter = formatter;
	}

	public int v(String tag, Object msg) {
		return print(msg);
	}

	public int v(String tag, Object msg, Throwable tr) {
		return print(msg, tr);
	}

	public int d(String tag, Object msg) {
		return print(msg);
	}

	public int d(String tag, Object msg, Throwable tr) {
		return print(msg, tr);
	}

	public int i(String tag, Object msg) {
		return print(msg);
	}

	public int i(String tag, Object msg, Throwable tr) {
		return print(msg, tr);
	}

	public int w(String tag, Object msg) {
		return print(msg);
	}

	public int w(String tag, Throwable tr) {
		return print(tr);
	}

	public int w(String tag, Object msg, Throwable tr) {
		return print(msg, tr);
	}

	public int e(String tag, Object msg) {
		return print(msg);
	}

	public int e(String tag, Object msg, Throwable tr) {
		return print(msg, tr);
	}

	public int l(String tag, Object msg) {
		return print(msg);
	}

	public int l(String tag, Object msg, Throwable tr) {
		return print(msg, tr);
	}

	private int print(Object msg) {
		String print = formatter.format(msg);
		out(print);

		return nrBytes(print);
	}

	private int print(Throwable tr) {
		String print = formatter.format(tr);
		out(print);

		return nrBytes(print);
	}

	private int print(Object msg, Throwable tr) {
		String print = formatter.format(msg, tr);
		out(print);

		return nrBytes(print);
	}

	protected int nrBytes(String print) {
		return print.getBytes().length;
	}

	protected abstract void out(String msg);
}
