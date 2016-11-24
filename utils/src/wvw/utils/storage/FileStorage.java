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
import java.util.HashMap;
import java.util.Map;

public abstract class FileStorage {

	private static int defaultType;

	private static Map<Integer, FileStorage> instances = new HashMap<Integer, FileStorage>();

	private static int nextId = 0;

	protected String storagePath = null;

	public static void setDefaultType(int loggerType) {
		defaultType = loggerType;
	}

	public static void addInstance(int storageType, FileStorage instance) {
		instances.put(storageType, instance);
	}

	public static FileStorage getStorage() {
		return instances.get(defaultType);
	}

	public static FileStorage getStorage(int storageType) {
		return instances.get(storageType);
	}

	protected static int getUniqueStorageTypeId() {
		return nextId++;
	}

	public FileStorage() {
	}

	public FileStorage(String storagePath) {
		this.storagePath = checkPath(storagePath);
	}

	private String checkPath(String path) {
		if (!path.endsWith("/"))
			return path + "/";
		else
			return path;
	}

	public boolean fileExists(String filePath) throws IOException {
		return fileExists(filePath, true);
	}

	public boolean fileExists(String filePath, boolean relative)
			throws IOException {

		return doFileExists(resolvePath(filePath, relative));
	}

	protected abstract boolean doFileExists(String filePath) throws IOException;

	public long getFileSize(String filePath) throws IOException {
		return getFileSize(filePath, true);
	}

	public long getFileSize(String filePath, boolean relative)
			throws IOException {

		return doGetFileSize(resolvePath(filePath, relative));
	}

	protected abstract long doGetFileSize(String filePath) throws IOException;

	public Reader getFileReader(String filePath) throws IOException {
		return getFileReader(filePath, true);
	}

	public Reader getFileReader(String filePath, boolean relative)
			throws IOException {

		return doGetFileReader(resolvePath(filePath, relative));
	}

	protected abstract Reader doGetFileReader(String filePath)
			throws IOException;

	public InputStream getFileInputStream(String filePath) throws IOException {
		return getFileInputStream(filePath, true);
	}

	public InputStream getFileInputStream(String filePath, boolean relative)
			throws IOException {

		return doGetFileInputStream(resolvePath(filePath, relative));
	}

	protected abstract InputStream doGetFileInputStream(String filePath)
			throws IOException;

	public OutputStream getFileOutputStream(String filePath, boolean append)
			throws IOException {

		return getFileOutputStream(filePath, true, append);
	}

	public OutputStream getFileOutputStream(String filePath, boolean relative,
			boolean append) throws IOException {

		return doGetFileOutputStream(resolvePath(filePath, relative), append);
	}

	protected abstract OutputStream doGetFileOutputStream(String filePath,
			boolean append) throws IOException;

	public FileWriter getFileWriter(String filePath) throws IOException {
		return getFileWriter(filePath, true);
	}

	public FileWriter getFileWriter(String filePath, boolean relative)
			throws IOException {

		return doGetFileWriter(resolvePath(filePath, relative));
	}

	protected abstract FileWriter doGetFileWriter(String filePath)
			throws IOException;

	public String readFile(String filePath) throws IOException {
		return readFile(filePath, true);
	}

	public String readFile(String filePath, boolean relative)
			throws IOException {

		return doReadFile(resolvePath(filePath, relative));
	}

	protected abstract String doReadFile(String filePath) throws IOException;

	public abstract String readFromStream(InputStream in) throws IOException;

	public byte[] readFileBytes(String filePath) throws IOException {
		return readFileBytes(filePath, true);
	}

	public byte[] readFileBytes(String filePath, boolean relative)
			throws IOException {

		return doReadFileBytes(resolvePath(filePath, relative));
	}

	protected abstract byte[] doReadFileBytes(String filePath)
			throws IOException;

	public void writeFile(String filePath, byte[] contents, boolean append)
			throws IOException {

		doWriteFile(resolvePath(filePath, true), contents, append);
	}

	public void writeFile(String filePath, byte[] contents) throws IOException {
		doWriteFile(resolvePath(filePath, true), contents, true);
	}

	public void writeFile(String filePath, boolean relative, byte[] contents,
			boolean append) throws IOException {

		doWriteFile(resolvePath(filePath, relative), contents, append);
	}

	protected abstract void doWriteFile(String filePath, byte[] contents,
			boolean append) throws IOException;

	public void writeFile(String filePath, String contents) throws IOException {
		doWriteFile(resolvePath(filePath, true), contents, true);
	}

	public void writeFile(String filePath, String contents, boolean append)
			throws IOException {
		
		doWriteFile(resolvePath(filePath, true), contents, append);
	}

	public void writeFile(String filePath, boolean relative, String contents)
			throws IOException {

		doWriteFile(resolvePath(filePath, relative), contents, true);
	}

	public void writeFile(String filePath, boolean relative, String contents,
			boolean append) throws IOException {

		doWriteFile(resolvePath(filePath, relative), contents, append);
	}

	protected abstract void doWriteFile(String filePath, String contents,
			boolean append) throws IOException;

	public void removeFile(String filePath) throws IOException {
		removeFile(filePath, true);
	}

	public void removeFile(String filePath, boolean relative)
			throws IOException {

		doRemoveFile(resolvePath(filePath, relative));
	}

	protected abstract void doRemoveFile(String filePath) throws IOException;

	public String[] getFilesInDirectory(String dirPath, boolean makeAbs)
			throws IOException {

		return getFilesInDirectory(dirPath, makeAbs, true);
	}

	public String[] getFilesInDirectory(String dirPath, boolean makeAbs,
			boolean relative) throws IOException {

		return doGetFilesInDirectory(resolvePath(dirPath, relative), makeAbs);
	}

	protected abstract String[] doGetFilesInDirectory(String dirPath,
			boolean makeAbs) throws IOException;

	public void removeFilesInDirectory(String dirPath) throws IOException {
		removeFilesInDirectory(dirPath, true);
	}

	public void removeFilesInDirectory(String dirPath, boolean relative)
			throws IOException {

		doRemoveFilesInDirectory(resolvePath(dirPath, relative));
	}

	protected abstract void doRemoveFilesInDirectory(String dirPath)
			throws IOException;

	public File getFile(String filePath) throws IOException {
		return getFile(filePath, true);
	}

	public File getFile(String filePath, boolean relative) throws IOException {
		return doGetFile(resolvePath(filePath, relative));
	}

	protected abstract File doGetFile(String filePath) throws IOException;

	public String resolvePath(String filePath) {
		return resolvePath(filePath, true);
	}

	public String resolvePath(String filePath, boolean relative) {
		if (relative && storagePath != null)
			return storagePath + filePath;
		else
			return filePath;
	}

	public void setStoragePath(String storagePath) {
		this.storagePath = storagePath;
	}

	public String getStoragePath() {
		return storagePath;
	}

	public abstract void fileDone(String filePath);
}