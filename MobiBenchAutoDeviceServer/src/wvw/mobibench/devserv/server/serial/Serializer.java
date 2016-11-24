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

package wvw.mobibench.devserv.server.serial;

import wvw.mobibench.devserv.server.msg.ResponseTypes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Serializer {

	private GsonBuilder gsonBuilder = new GsonBuilder();
	private Gson gson = gsonBuilder.create();

	public Serializer() {

		EnumSerializer enumSerial = new EnumSerializer();
		EnumDeserializer enumDeserial = new EnumDeserializer();

		gsonBuilder.registerTypeAdapter(ResponseTypes.class, enumSerial);
		gsonBuilder.registerTypeAdapter(ResponseTypes.class, enumDeserial);
	}

	public String serialize(Object data) {
		return gson.toJson(data);
	}

	public <T> T deserialize(String json, Class<T> classOfT) {
		return gson.fromJson(json, classOfT);
	}
}
