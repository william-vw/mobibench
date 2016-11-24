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

BuiltinRuleInference = function(engine, config) {

	RuleInference.call(this, engine, config);
	
	this.runBenchmark = function(callback) {
		if (arguments.length > 1) {			
			this.resources = arguments[1];
			
			this.config.resources = arguments[1];
		}
		
		var subFlow = this.createSubFlow();
		
		var flow = this.createProcessFlow({
			op : subFlow.inference,
			
			obj : subFlow
		});
		
		flow.execute(callback);
	};
	
	this.createSubFlow = function() {
		var subFlow = null;		
		
		var type = this.reasoning.mechanism.rule_inference.subFlow; 
		switch (type) {
		
		case 'load_data_exec_rules':
			subFlow = new LoadDataExecRules(this, this.config);
			
			break;
			
		case 'load_rules_data_exec':
			subFlow = new LoadRulesDataExec(this, this.config);
			
			break;
		}
		
		return subFlow;
	};
}
