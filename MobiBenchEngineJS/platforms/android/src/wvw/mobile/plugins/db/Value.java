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

package wvw.mobile.plugins.db;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.utils.JsonWritable;
import android.os.Parcel;
import android.os.Parcelable;

public class Value implements JsonWritable, Parcelable {

	private String value;

	public Value(String value) {
		this.value = value;
	}

	public void toJson(JSONObject obj) throws JSONException {
		obj.put("value", value);
	}

	public Value(Parcel in) {
		value = in.readString();
	}

	public int describeContents() {
		return 0;
	}

	public void writeToParcel(Parcel dest, int flags) {
		dest.writeString(value);
	}
	
	public static final Parcelable.Creator<Value> CREATOR = new Parcelable.Creator<Value>() {

		public Value createFromParcel(Parcel in) {
			return new Value(in);
		}

		public Value[] newArray(int size) {
			return new Value[size];
		}
	};
}
