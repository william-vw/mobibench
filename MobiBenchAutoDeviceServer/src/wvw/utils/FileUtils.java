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

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;

public class FileUtils {

	public static boolean fileExists(String filePath) throws IOException {
		return new File(filePath).exists();
	}

	public static Reader getFileReader(String filePath) throws IOException {
		return new FileReader(filePath);
	}

	public static InputStream getFileInputStream(String filePath)
			throws IOException {
		
		return new FileInputStream(filePath);
	}

	public static OutputStream getFileOutputStream(String filePath, boolean append)
			throws IOException {
		
		return new FileOutputStream(filePath, append);
	}
	
	public static FileWriter getFileWriter(String filePath) throws IOException {
		return new FileWriter(new File(filePath));
	}

	public static long getFileSize(String filePath) throws IOException {
		return new File(filePath).length();
	}

	public static String readFile(String filePath) throws IOException {
		InputStream fin = getFileInputStream(filePath);

		return IOUtils.readFromStream(fin);
	}

	public static byte[] readFileBytes(String filePath) throws IOException {
		InputStream fin = getFileInputStream(filePath);

		byte[] b = new byte[1024];
		int len = 0;
		ByteArrayOutputStream bOut = new ByteArrayOutputStream();
		while ((len = fin.read(b)) != -1)
			bOut.write(b, 0, len);

		return bOut.toByteArray();
	}

	public static void writeFile(String filePath, String contents)
			throws IOException {
		writeFile(filePath, contents, true);
	}

	public static void writeFile(String filePath, String contents,
			boolean append) throws IOException {

		writeFile(filePath, contents.getBytes(), append);
	}

	public static void writeFile(String filePath, byte[] contents)
			throws IOException {
		writeFile(filePath, contents, true);
	}

	public static void writeFile(String filePath, byte[] contents,
			boolean append) throws IOException {

		FileOutputStream out = new FileOutputStream(filePath, append);

		out.write(contents);

		out.flush();
		out.close();
	}

	public static void removeFile(String filePath) throws IOException {
		File file = new File(filePath);
		file.delete();
	}

	public static void removeDirectory(String dirPath, boolean removeDir)
			throws IOException {

		removeDirectory(new File(dirPath), removeDir);
	}

	private static void removeDirectory(File dir, boolean removeDir)
			throws IOException {

		if (dir.exists()) {
			File[] files = dir.listFiles();
			for (int i = 0; i < files.length; i++) {
				if (files[i].isDirectory())
					removeDirectory(files[i], true);
				else
					files[i].delete();
			}
		}

		if (removeDir)
			dir.delete();
	}

	public static String[] getFilesInDirectory(String dirPath, boolean makeAbs)
			throws IOException {

		File dir = new File(dirPath);
		String[] files = dir.list();

		if (makeAbs && files != null) {
			for (int i = 0; i < files.length; i++)
				files[i] = dirPath + "/" + files[i];
		}

		return files;
	}
}
