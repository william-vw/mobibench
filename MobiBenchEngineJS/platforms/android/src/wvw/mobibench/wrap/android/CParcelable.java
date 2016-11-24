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

import java.lang.reflect.Constructor;

import android.os.Parcel;
import android.os.Parcelable;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;

public class CParcelable implements Parcelable {

	private Cartonable cartonable;

	public CParcelable(Cartonable cartonable) {
		this.cartonable = cartonable;
	}
	
	public static Parcelable[] convert(Cartonable[] cs) {
		Parcelable[] ps = new Parcelable[cs.length];

		for (int i = 0; i < ps.length; i++)
			ps[i] = new CParcelable(cs[i]);
		
		return ps;
	}

	public Cartonable getCartonable() {
		return cartonable;
	}

	public int describeContents() {
		return 0;
	}

	public void writeToParcel(Parcel dest, int flags) {
		writeCls(dest);

		writeData(dest);
	}

	@SuppressWarnings("rawtypes")
	private void writeCls(Parcel dest) {
		Class cls = cartonable.getClass();

		dest.writeString(cls.getName());
	}

	private void writeData(Parcel dest) {
		cartonable.writeTo(new CParcel(dest));
	}

	public static final Parcelable.Creator<CParcelable> CREATOR = new Parcelable.Creator<CParcelable>() {

		public CParcelable createFromParcel(Parcel in) {
			String clsName = in.readString();

			try {
				Constructor<?> cons = Class.forName(clsName).getConstructor(Carton.class);
				Cartonable cartonable = (Cartonable) cons.newInstance(new CParcel(in));

				return new CParcelable(cartonable);

			} catch (Exception e) {
				e.printStackTrace();
			}

			return null;
		}

		public CParcelable[] newArray(int size) {
			return new CParcelable[size];
		}
	};
}
