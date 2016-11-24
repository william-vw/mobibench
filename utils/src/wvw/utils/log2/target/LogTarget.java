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

public interface LogTarget {

	public int d(String tag, Object msg);
	
	public int d(String tag, Object msg, Throwable tr);

	public int v(String tag, Object msg);
	
	public int v(String tag, Object msg, Throwable tr);

	public int i(String tag, Object msg);
	
	public int i(String tag, Object msg, Throwable tr);

	public int w(String tag, Object msg);
	
	public int w(String tag, Throwable tr);
	
	public int w(String tag, Object msg, Throwable tr);

	public int e(String tag, Object msg);

	public int e(String tag, Object msg, Throwable tr);

	public int l(String tag, Object msg);

	public int l(String tag, Object msg, Throwable tr);

	public void done();
}
