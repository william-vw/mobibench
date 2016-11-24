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
package wvw.mobibench.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.parcel.DataParcel;
import wvw.mobibench.wrap.Carton;
import wvw.utils.JsonReadable;
import wvw.utils.JsonWritable;

public abstract class ResourceConfig extends DataParcel implements JsonReadable, JsonWritable {

	protected String resStr;
	protected List<String> resList;

	protected String assetPath;
	protected boolean composed;

	public ResourceConfig() {
	}

	protected boolean hasString() {
		return resStr != null;
	}

	protected String getString() {
		return resStr;
	}

	protected void setString(String dataStr) {
		this.resStr = dataStr;
	}

	protected boolean hasList() {
		return resList != null;
	}

	protected List<String> getList() {
		return resList;
	}

	protected void setList(List<String> dataList) {
		this.resList = dataList;
	}

	public boolean hasPath() {
		return assetPath != null;
	}

	public String getPath() {
		return assetPath;
	}

	public void setPath(String assetPath) {
		this.assetPath = assetPath;
	}

	public void combineWith(ResourceConfig otherConfig) {
		if (hasString() && otherConfig.hasString())
			resStr += "\n" + otherConfig.getString();

		else if (hasList() && otherConfig.hasList())
			resList.addAll(otherConfig.getList());
	}

	public void fromJson(JSONObject obj) throws JSONException {		
		// if (obj.has("content")) {
		Object content = obj.get("content");

		if (content instanceof String)
			setString((String) content);

		else {
			JSONArray array = (JSONArray) content;

			resList = new ArrayList<String>();
			for (int i = 0; i < array.length(); i++)
				resList.add(array.getString(i));
		}
		
		// Log.d("resStr? " + resStr);
		// Log.d("resList? " + resList);

		// } else
		// assetPath = "www/" + obj.getString("path");
	}

	// public void load() {
	// if (!hasString()) {
	// AssetManager assetMan = App.context.getAssets();
	//
	// try {
	// InputStream in = assetMan.open(assetPath);
	//
	// setString(IOUtils.readString(in));
	//
	// } catch (IOException e) {
	// e.printStackTrace();
	//
	// Log.e("benchmark", "error loading resource: " + e);
	// }
	// }
	// }

	public ResourceConfig(Carton in) {
		try {
			fromFile(in);

		} catch (IOException e) {
			e.printStackTrace();
		}

		// int flag = in.readInt();
		// switch (flag) {
		//
		// case 0:
		// setString(in.readString());
		//
		// break;
		//
		// case 1:
		// setPath(in.readString());
		//
		// break;
		// }
	}

	public void writeTo(Carton dest) {
		try {
			toFile(dest);

		} catch (IOException e) {
			e.printStackTrace();
		}

		// if (hasString()) {
		// dest.writeInt(0);
		//
		// dest.writeString(resStr);
		//
		// } else {
		// dest.writeInt(1);
		//
		// dest.writeString(assetPath);
		// }
	}

	public boolean equals(Object obj) {
		if (obj instanceof ResourceConfig) {

			ResourceConfig config = (ResourceConfig) obj;
			if (hasString())
				return (config.hasString() && resStr.equals(config.getString()));

			if (hasList())
				return (config.hasList() && resList.equals(config.getList()));

			// if (hasPath())
			// return (config.hasPath() && assetPath.equals(config.getPath()));
		}

		return false;
	}
}
