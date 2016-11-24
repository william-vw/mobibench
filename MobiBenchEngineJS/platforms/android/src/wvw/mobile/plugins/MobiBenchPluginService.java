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

import android.app.Service;
import android.content.Intent;
import android.os.Parcelable;
import wvw.mobibench.bg_task.BgExceptionListener;
import wvw.mobibench.wrap.Cartonable;
import wvw.mobibench.wrap.android.CParcelable;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;

public abstract class MobiBenchPluginService extends Service
		implements BgExceptionListener {

	protected void init() {
		Log.setTarget(new SystemOutTarget());
	}

	protected void sendBack(Intent orIntent, Object... retValues) {
		Log.d("service.sendBack");
		
		Intent returnIntent = orIntent.getParcelableExtra("returnIntent");

		if (retValues.length > 0) {
			if (retValues.length > 1) {

				String id = (String) retValues[0];
				Object retValue = retValues[1];
				
				if (retValue instanceof Integer)
					returnIntent.putExtra(id, ((Integer) retValue).intValue());

				else if (retValue instanceof String)
					returnIntent.putExtra(id, ((String) retValue));

				else if (Cartonable.class.isAssignableFrom(retValue.getClass()))
					returnIntent.putExtra(id, parcelize(retValue));

				else if (Cartonable[].class.isAssignableFrom(retValue.getClass()))
					returnIntent.putExtra(id,
							parcelize((Cartonable[]) retValue));

			} else {
				Exception e = (Exception) retValues[0];

				returnIntent.putExtra("exception", e);
			}
		}

		sendBroadcast(returnIntent);
	}

	private Parcelable parcelize(Object retValue) {
		return new CParcelable((Cartonable) retValue);
	}

	private Parcelable[] parcelize(Cartonable[] retValue) {
		return CParcelable.convert(retValue);
	}
}
