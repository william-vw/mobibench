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

package wvw.mobibench.service.file;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;

import wvw.utils.IOUtils;

public class ManagedFile {

	private int id = -1;

	private String path;
	private String location;
	private String ext;

	private File curFile;

	private long fileLimit;

	public ManagedFile(String path, long fileLimit) {
		this.path = path;
		init();

		this.fileLimit = fileLimit;
	}

	public void store(BufferedReader reader, boolean append)
			throws IOException {

		checkFile();

		IOUtils.writeTo(reader, curFile, append);
	}

	public void store(String contents, boolean append) throws IOException {
		checkFile();

		IOUtils.writeToFile(contents, curFile, append);
	}

	private void checkFile() throws IOException {
		if (curFile == null || curFile.length() > fileLimit) {
			id++;

			curFile = new File(filePath());
		}

		// possible it was removed during the server instance lifetime
		curFile.getParentFile().mkdirs();
	}

	private String filePath() {
		if (id > 0)
			return location + id + ext;
		else
			return path;
	}

	public String getAbsolutePath() {
		return curFile.getAbsolutePath();
	}

	private void init() {
		int sepIdx = this.path.lastIndexOf(".");

		this.location = this.path.substring(0, sepIdx);
		this.ext = this.path.substring(sepIdx);
	}
}
