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

import java.util.HashMap;
import java.util.Map;

public class ManagedFiles {

	private long fileLimit;
	private Map<String, ManagedFile> map = new HashMap<String, ManagedFile>();

	public ManagedFiles(long fileLimit) {
		this.fileLimit = fileLimit;
	}

	public ManagedFile getFile(String path) {
		ManagedFile file = map.get(path);
		if (file == null) {
			file = new ManagedFile(path, fileLimit);

			map.put(path, file);
		}

		return file;
	}
}
