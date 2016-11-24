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
package wvw.mobibench.loader.android;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Modifier;
import java.util.zip.ZipFile;

import org.jf.dexlib2.DexFileFactory;
import org.jf.dexlib2.iface.ClassDef;

import android.content.Context;
import dalvik.system.DexClassLoader;
import wvw.mobibench.App;
import wvw.mobibench.engine.ReasoningEngine;
import wvw.mobibench.exception.LoadingException;
import wvw.mobibench.loader.EngineDependencyLoader;
import wvw.utils.IOUtils;
import wvw.utils.android.AndroidIOUtils;
import wvw.utils.log2.Log;

public class AndroidDependencyLoader extends EngineDependencyLoader {

	// TODO put jarred dex files in external storage, so they don't have to be
	// re-deployed together with apk each time?

	// courtesy of
	// http://android-developers.blogspot.co.nz/2011/07/custom-class-loading-in-dalvik.html
	public ReasoningEngine load(String engineId) throws LoadingException {
		if (!check(engineId))
			return currentEngine;

		Log.d("loading engine plugin & dependencies..");

		String jarName = engineId.toLowerCase() + ".jar";
		String assetPath = "libs/" + jarName;

		File dexDir = App.context.getDir("dex", Context.MODE_PRIVATE);

		File jarFile = new File(dexDir, jarName);
		File dexFile = new File(dexDir, "classes.dex");

		try {
			AndroidIOUtils.copyFromAssets(assetPath, jarFile, App.context);
			extractFromArchive(jarFile, dexFile.getName(), dexFile);

			File dexOptDir = App.context.getDir("outdex", Context.MODE_PRIVATE);
			DexClassLoader dexClassLoader = new DexClassLoader(jarFile.getAbsolutePath(), dexOptDir.getAbsolutePath(),
					null, App.context.getClassLoader());

			org.jf.dexlib2.iface.DexFile dexFile2 = DexFileFactory.loadDexFile(dexFile, 19);
			for (ClassDef classDef : dexFile2.getClasses()) {
				String className = getClassName(classDef.getType());
				// System.out.println("className: " + className);

				Class<?> cls = dexClassLoader.loadClass(className);

				if (!Modifier.isAbstract(cls.getModifiers()) && ReasoningEngine.class.isAssignableFrom(cls))
					currentEngine = (ReasoningEngine) cls.newInstance();
			}

			if (currentEngine == null)
				throw new LoadingException("Cannot find ReasoningClass subclass");

			Log.d("loading success");

			return currentEngine;

		} catch (Exception e) {

			throw new LoadingException("Error loading ReasoningEngine instance", e);
		}
	}

	private String getClassName(String typeStr) {
		return typeStr.replaceAll("/", ".").substring(1, typeStr.length() - 1);
	}

	private void extractFromArchive(File archiveFile, String entryName, File targetFile) throws IOException {
		ZipFile archive = new ZipFile(archiveFile);

		InputStream in = archive.getInputStream(archive.getEntry(entryName));
		IOUtils.writeToFile(in, targetFile);

		archive.close();
	}
}
