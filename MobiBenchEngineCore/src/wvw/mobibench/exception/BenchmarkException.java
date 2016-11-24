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
package wvw.mobibench.exception;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.utils.JsonWritable;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;

public class BenchmarkException extends Exception implements JsonWritable,
		Cartonable {

	private static final long serialVersionUID = 1L;

	public BenchmarkException() {
	}

	public BenchmarkException(String msg) {
		super(msg);
	}

	public BenchmarkException(Exception e) {
		super(e);
	}
	
	public BenchmarkException(String msg, Exception e) {
		super(msg, e);
	}

	public void toJson(JSONObject obj) throws JSONException {
		obj.put("type", "exception");

		obj.put("class", getClass().toString());
		obj.put("msg", getMessage());
	}

	public BenchmarkException(Carton in) {
		super(in.readString());
	}

	public void writeTo(Carton dest) {
		dest.writeString(getMessage());
	}
}
