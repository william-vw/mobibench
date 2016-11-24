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

package wvw.mobile.plugins;

import org.apache.cordova.CordovaPlugin;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Intent;
import android.os.Parcelable;
import wvw.mobibench.wrap.Cartonable;
import wvw.mobibench.wrap.android.CParcelable;
import wvw.utils.JsonWritable;

public abstract class MobiBenchPlugin extends CordovaPlugin {

	protected JSONObject getJson(Intent intent, String name)
			throws JSONException {

		Cartonable cable = unparcelize(intent.getParcelableExtra(name));
		JsonWritable writable = (JsonWritable) cable;

		JSONObject obj = new JSONObject();
		writable.toJson(obj);

		// Log.d("JSON object: " + obj);

		return obj;
	}

	private Cartonable unparcelize(Parcelable parcel) {
		return ((CParcelable) parcel).getCartonable();
	}
}
