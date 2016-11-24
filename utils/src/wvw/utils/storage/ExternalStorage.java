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

package wvw.utils.storage;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;

import wvw.utils.FileUtils;
import wvw.utils.IOUtils;

public abstract class ExternalStorage extends FileStorage {

	public static final int TYPE = getUniqueStorageTypeId();

	public ExternalStorage(String storagePath) {
		super(storagePath);
	}

	protected boolean doFileExists(String filePath) throws IOException {
		return FileUtils.fileExists(filePath);
	}

	protected long doGetFileSize(String filePath) throws IOException {
		return FileUtils.getFileSize(filePath);
	}

	protected Reader doGetFileReader(String filePath) throws IOException {
		return FileUtils.getFileReader(filePath);
	}

	protected InputStream doGetFileInputStream(String filePath) throws IOException {
		return FileUtils.getFileInputStream(filePath);
	}

	protected OutputStream doGetFileOutputStream(String filePath, boolean append)
			throws IOException {

		return FileUtils.getFileOutputStream(filePath, append);
	}

	protected FileWriter doGetFileWriter(String filePath) throws IOException {
		return FileUtils.getFileWriter(filePath);
	}

	protected String doReadFile(String filePath) throws IOException {
		return FileUtils.readFile(filePath);
	}

	public String readFromStream(InputStream in) throws IOException {
		return IOUtils.readFromStream(in);
	}

	protected byte[] doReadFileBytes(String filePath) throws IOException {
		return FileUtils.readFileBytes(filePath);
	}

	protected void doWriteFile(String filePath, byte[] contents, boolean append)
			throws IOException {

		File file = new File(filePath);
		boolean existed = file.exists();

		FileUtils.writeFile(filePath, contents, append);

		if (!existed)
			fileDone(filePath);
	}

	protected void doWriteFile(String filePath, String contents, boolean append)
			throws IOException {

		File file = new File(filePath);
		boolean existed = file.exists();

		FileUtils.writeFile(filePath, contents, append);

		if (!existed)
			fileDone(filePath);
	}

	protected void doRemoveFile(String filePath) throws IOException {
		FileUtils.removeFile(filePath);
	}

	protected String[] doGetFilesInDirectory(String dirPath, boolean makeAbs)
			throws IOException {

		return FileUtils.getFilesInDirectory(dirPath, makeAbs);
	}

	protected void doRemoveFilesInDirectory(String dirPath) throws IOException {
		String[] files = getFilesInDirectory(dirPath, true);

		for (String file : files)
			removeFile(file, false);
	}

	protected File doGetFile(String filePath) throws IOException {
		return new File(filePath);
	}
}
