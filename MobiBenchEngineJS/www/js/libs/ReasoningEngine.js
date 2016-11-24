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

function ReasoningEngine() {

	this.loadData = function(bConfig, dataset, callback) {
		this.doLoadData(bConfig, dataset, callback);
	}

	this.execRules = function(bConfig, ruleset, callback) {
		if (!this.checkConfig(bConfig)) {
			callback();

			return;
		}

		this.doExecRules(bConfig, ruleset, callback);
	}

	this.loadRules = function(bConfig, ruleset, callback) {
		this.doLoadRules(bConfig, ruleset, callback);
	};

	this.execute = function(bConfig, callback) {
		if (!this.checkConfig(bConfig)) {
			callback();

			return;
		}

		this.doExecute(bConfig, callback);
	}

	this.inference = function(bConfig, ontology, callback) {
		if (!this.checkConfig(bConfig)) {
			callback();

			return;
		}

		this.doInference(bConfig, ontology, callback);
	}

	this.checkConfig = function(config) {
		var mech = config.mechanism;
		var scope = config.scope;

		var eMech = this.config.reasoning.mechanism;
		var eScopes = null;
		var eScopeTypes = null;

		for ( var mechId in mech) {
			if (mech.hasOwnProperty(mechId)) {

				if (mech[mechId].dependency != undefined)
					continue;

				if (eMech[mechId] == undefined) {
					throw "ERROR <mechanism>: expected one of ["
							+ collectIds(eMech) + "], found \"" + mechId + "\"";
				}

				if (mech[mechId].subFlow != eMech[mechId].subFlow) {
					throw "ERROR <subflow>: expected \""
							+ eMech[mechId].subFlow + "\", found \""
							+ mech[mechId].subFlow + "\"";
				}

				eScopes = eMech[mechId].scopes;
			}
		}

		if (eScopes == undefined || eScopes.length == 0) {

			if (scope != undefined) {
				throw "ERROR <scope> \"" + scope.type
						+ "\" found, but no scopes supported by engine";

			} else
				return true;
		}

		eScopeTypes = collectElementProperties(eScopes, "type");

		if (scope == undefined) {
			throw "ERROR <scope> expected one of [" + eScopeTypes + "]";
		}

		var match = false;

		for (var i = 0; i < eScopes.length; i++) {
			var eScope = eScopes[i];

			if (eScope.type == scope.type) {
				if ((eScope.options != undefined && eScope.options.length > 0)
						&& scope.options.length == 0)

					throw "ERROR <scope-option> expected one of ["
							+ eScope.options + "]";

				for (var j = 0; j < scope.options.length; j++) {
					var option = scope.options[j];

					if (eScope.options.length == 0) {
						throw "ERROR <scope-option> none supported by engine, "
								+ "found \"" + option + "\"";
					}

					var match2 = false;
					for (var k = 0; k < eScope.options.length; k++) {
						var eOption = eScope.options[k];

						if (option == eOption) {
							match2 = true;

							break;
						}
					}

					if (!match2) {
						throw "ERROR <scope-option> expected one of ["
								+ eScope.options + "], found \"" + option
								+ "\"";
					}
				}

				match = true;

				break;
			}
		}

		if (!match)
			throw "ERROR <scope>: expected one of [" + eScopeTypes
					+ "], found \"" + scope.type + "\"";

		return true;
	}
}
