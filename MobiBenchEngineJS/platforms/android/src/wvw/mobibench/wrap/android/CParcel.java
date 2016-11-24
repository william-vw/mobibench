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

package wvw.mobibench.wrap.android;

import android.os.Parcel;
import wvw.mobibench.wrap.Carton;

public class CParcel implements Carton {

	private Parcel parcel;

	public CParcel(Parcel parcel) {
		this.parcel = parcel;
	}

	public void writeInt(int i) {
		parcel.writeInt(i);
	}

	public void writeLong(long l) {
		parcel.writeLong(l);
	}

	public void writeString(String s) {
		parcel.writeString(s);
	}

	public String readString() {
		return parcel.readString();
	}

	public int readInt() {
		return parcel.readInt();
	}

	public long readLong() {
		return parcel.readLong();
	}

}
