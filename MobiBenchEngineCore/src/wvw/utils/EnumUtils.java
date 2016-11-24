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

public class EnumUtils {

	@SuppressWarnings("rawtypes")
	public static String getLabel(Enum enoem) {
		return enoem.toString().toLowerCase();
	}

	@SuppressWarnings("rawtypes")
	public static Enum getEnum(Enum[] enoems, String label) {
		label = label.toLowerCase();

		for (Enum enoem : enoems)
			if (enoem.toString().toLowerCase().equals(label))

				return enoem;

		return null;
	}

	@SuppressWarnings("rawtypes")
	public static Enum getEnum(Enum[] enoems, int id) {
		if (id == -1)
			return null;
		else
			return enoems[id];
	}

}