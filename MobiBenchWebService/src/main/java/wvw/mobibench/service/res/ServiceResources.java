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

package wvw.mobibench.service.res;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;

import wvw.mobibench.service.config.Config;
import wvw.mobibench.service.file.ManagedFile;
import wvw.mobibench.service.file.ManagedFiles;
import wvw.mobibench.service.preproc.PreProcessConfig.Ontology;
import wvw.utils.IOUtils;
import wvw.utils.timer.ResultTime;

public class ServiceResources {

	private ServletContext ctx;
	private String resPath = "/WEB-INF/";

	private ManagedFiles files = new ManagedFiles(1 * 1024 * 1024);

	public ServiceResources(ServletContext ctx) {
		this.ctx = ctx;
	}

	public ServletContext getCtx() {
		return ctx;
	}

	public String getResPath() {
		return resPath;
	}

	public InputStream getInputStream(String path) {
		// System.out.println(ctx.getResourcePaths("/WEB-INF/"));
		
		return ctx.getResourceAsStream(resPath + path);
	}

	public String getContents(String path) throws IOException {
		return IOUtils.readFromStream(getInputStream(path));
	}

	public String store(String name, BufferedReader reader, boolean append) throws IOException {

		ManagedFile mFile = getFile(name);
		mFile.store(reader, append);

		return mFile.getAbsolutePath();
	}

	public String store(String name, String contents, boolean append) throws IOException {

		ManagedFile mFile = getFile(name);
		mFile.store(contents, append);

		return mFile.getAbsolutePath();
	}

	protected ManagedFile getFile(String name) {
		File file = new File(name);

		if (!file.isAbsolute()) {
			File folder = new File(Config.get("storagePath"));

			file = new File(folder, name);
		}

		return files.getFile(file.getPath());
	}

	public void store(String task, Ontology ontology, ResultTime time) {
		String ontologyPath = ontology.getPath();

		String name = ontologyPath.substring(ontologyPath.lastIndexOf("/") + 1);
		name = task + "/" + name + ".txt";

		try {
			store(name, time.toString() + "\n", true);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
