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
package wvw.mobibench.service.servlet.msg.serial;

import java.lang.reflect.Type;
import java.util.EnumSet;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

@SuppressWarnings("rawtypes")
public class EnumDeserializer implements JsonDeserializer<Enum> {

	@SuppressWarnings("unchecked")
	public Enum deserialize(JsonElement json, Type typeOfT,
			JsonDeserializationContext context) throws JsonParseException {

		String jsonStr = json.getAsString().toLowerCase();
		
		EnumSet enumSet = EnumSet.allOf((Class) typeOfT);
		for (Object obj : enumSet.toArray()) {
			String str = obj.toString().toLowerCase();
			
			if (str.equals(jsonStr))
				return (Enum) obj;
		}

		throw new JsonParseException("Error deserializing JSON Enum: unknown "
				+ "identifier \"" + json.getAsString() + "\"");
	}
}