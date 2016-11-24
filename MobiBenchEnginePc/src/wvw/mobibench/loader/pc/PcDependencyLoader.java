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

package wvw.mobibench.loader.pc;

import java.io.File;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;

import wvw.mobibench.MobiBenchEnginePc;
import wvw.mobibench.engine.ReasoningEngine;
import wvw.mobibench.exception.LoadingException;
import wvw.mobibench.loader.EngineDependencyLoader;
import wvw.utils.log2.Log;

public class PcDependencyLoader extends EngineDependencyLoader {

	public ReasoningEngine load(String engineId) throws LoadingException {
		if (!check(engineId))
			return currentEngine;
		
		URLClassLoader sysLoader = (URLClassLoader) ClassLoader.getSystemClassLoader();
		Class<?> sysClass = URLClassLoader.class;
		try {
			File file = new File(MobiBenchEnginePc.jarPath + jarName(engineId));
			
			URL url = file.toURI().toURL();
			Log.d("loading: " + url);
			
			Method method = sysClass.getDeclaredMethod("addURL", URL.class);
			method.setAccessible(true);
			method.invoke(sysLoader, url);

			Class<?> cls = ClassLoader.getSystemClassLoader().loadClass("wvw.mobibench.engine." + engineId);
			this.currentEngine = (ReasoningEngine) cls.getConstructor().newInstance();

			return currentEngine;
			
		} catch (Exception e) {
			e.printStackTrace();
			
			throw new LoadingException("Error loading ReasoningEngine instance", e);
		}
	}
}
