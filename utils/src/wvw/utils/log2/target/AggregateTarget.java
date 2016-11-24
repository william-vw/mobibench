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

import wvw.utils.log2.format.Formatter;

public class AggregateTarget extends FormattedLogTarget {

	private FormattedLogTarget[] targets;

	public AggregateTarget(FormattedLogTarget... targets) {
		this.targets = targets;
	}

	public AggregateTarget(Formatter formatter, FormattedLogTarget... targets) {
		super(formatter);

		this.targets = targets;
	}

	protected void out(String msg) {	
		for (FormattedLogTarget target : targets)
			target.out(msg);
	}

	public void done() {
		for (LogTarget target : targets)

			target.done();
	}
}
