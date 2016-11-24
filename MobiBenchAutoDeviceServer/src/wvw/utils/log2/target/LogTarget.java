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

	public void d(String tag, Object msg);

	public void v(String tag, Object msg);

	public void i(String tag, Object msg);

	public void w(String tag, Object msg);

	public void e(String tag, Object msg);

	public void e(String tag, Object msg, Exception e);

	public void l(String tag, Object msg);

	public void l(String tag, Object msg, Exception e);

	public void done();
}
