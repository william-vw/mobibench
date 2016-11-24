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

package wvw.utils.pc;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONObject;

import wvw.utils.IOUtils;

public class HttpHelper {

	public static String post(String url, JSONArray headers, String data) {
		HttpPost httpPost = new HttpPost(url);

		for (int i = 0; i < headers.length(); i++) {
			JSONArray header = headers.getJSONArray(i);

			httpPost.addHeader(header.getString(0), header.getString(1));
		}

		String ret = null;
		try {
			httpPost.setEntity(new StringEntity(data));

			HttpClient httpClient = new DefaultHttpClient();
			HttpResponse response = httpClient.execute(httpPost);

			StatusLine status = response.getStatusLine();

			switch (status.getStatusCode()) {

			case 200:
				ret = IOUtils.readFromStream(response.getEntity().getContent());

				break;

			default:
				ret = genError(status.getReasonPhrase());

				break;
			}

		} catch (IOException e) {
			// e.printStackTrace();

			ret = genError(e.getClass() + ": " + e.getMessage());
		}

		return ret;
	}

	private static String genError(String msg) {
		JSONObject o = new JSONObject();
		o.put("type", "ERROR");
		o.put("msg", msg);

		return o.toString();
	}
}
