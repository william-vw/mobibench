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
package wvw.utils;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JsonUtils {

	public static void notFound(JsonReadable caller, String name)
			throws JSONException {

		notFound(caller.getClass(), name);
	}

	@SuppressWarnings("rawtypes")
	public static void notFound(Class clazz, String name) throws JSONException {
		throw new JSONException(clazz.getName() + ": expected '" + name
				+ "' field");
	}

	public static void checkField(JsonReadable caller, JSONObject obj,
			String name) throws JSONException {

		checkField(caller.getClass(), obj, name);
	}

	@SuppressWarnings("rawtypes")
	public static void checkField(Class clazz, JSONObject obj, String name)
			throws JSONException {

		if (!obj.has(name))
			notFound(clazz, name);
	}

	public static boolean isEnum(JSONObject obj) {
		return obj.has("id");
	}

	public static int getEnumId(JSONObject obj) throws JSONException {
		return obj.getInt("id");
	}

	public static int getEnumId(JSONObject obj, String name)
			throws JSONException {

		return obj.getJSONObject(name).getInt("id");
	}
	
	public static JSONObject genEnum(int id) throws JSONException {
		JSONObject obj = new JSONObject();
		obj.put("id", id);
		
		return obj;
	}

	public static int getInt(JsonReadable caller, JSONObject obj,
			String[] altNames) throws JSONException {

		return getInt(caller, obj, altNames, true);
	}

	public static int getInt(JsonReadable caller, JSONObject obj,
			String[] altNames, boolean throwExc) throws JSONException {

		int value = -1;
		for (String altName : altNames) {

			if (obj.has(altName)) {
				value = (Integer) obj.getInt(altName);

				break;
			}
		}

		if (value == -1 && throwExc)
			throw new JSONException(caller.getClass() + ": expected "
					+ LogUtils.toString(altNames, " / ", "'") + " field");

		return value;
	}

	public static List<JSONObject> getObjects(JSONObject obj, String name)
			throws JSONException {

		return getObjects(obj, name, name + "s");
	}

	public static List<JSONObject> getObjects(JSONObject obj, String name,
			String plural) throws JSONException {

		List<JSONObject> objs = new ArrayList<JSONObject>();
		if (obj.has(plural)) {

			JSONArray array = obj.getJSONArray(plural);
			for (int i = 0; i < array.length(); i++)
				objs.add(array.getJSONObject(i));

		} else if (obj.has(name))
			objs.add(obj.getJSONObject(name));

		else
			throw new JSONException("Severity: no " + name + " info found");

		return objs;
	}
}
