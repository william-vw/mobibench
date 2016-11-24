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

package wvw.mobibench.auto;

import wvw.mobibench.BenchmarkEngineListener;
import wvw.mobibench.MobiBenchEnginePc;
import wvw.mobibench.exception.BenchmarkException;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;

public class AutoBenchmarkPc extends AutoBenchmark implements BenchmarkEngineListener {

	private MobiBenchEnginePc engine;

	private static void init() {
		Log.setTarget(new SystemOutTarget());
	}

	public static void main(String[] args) {
		init();

		AutoBenchmarkPc auto = new AutoBenchmarkPc();
		auto.run();
	}

	public AutoBenchmarkPc() {
		super(0);
		
		try {
			this.engine = new MobiBenchEnginePc(this);

		} catch (BenchmarkException e) {
			e.printStackTrace();
		}
	}

	protected void doBenchmark(String config) {
		Log.d(">> doBenchmark");

		try {
			engine.execBenchmark(config);

		} catch (BenchmarkException e) {
			e.printStackTrace();
		}
	}

	public void benchmarkDone() {
		benchmarkNext();
	}

	protected void allDone() {
		Log.d(">> allDone");
	}
}
