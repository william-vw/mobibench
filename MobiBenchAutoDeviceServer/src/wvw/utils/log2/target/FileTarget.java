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

package wvw.utils.log2.target;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import wvw.utils.log2.format.Formatter;

public class FileTarget extends FormattedLogTarget {

	private FileWriter writer;

	public FileTarget(String path) {
		createWriter(path);
	}

	public FileTarget(String path, Formatter formatter) {
		super(formatter);

		createWriter(path);
	}

	private void createWriter(String path) {
		try {
			writer = new FileWriter(new File(path));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void out(String msg) {
		try {
			writer.write(msg + "\n");

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void done() {
		try {
			writer.flush();
			writer.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
