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

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;

public class IOUtils {
	public static String readFromFile(File file) throws IOException {
		BufferedReader bReader = new BufferedReader(new FileReader(file));

		StringBuffer contents = new StringBuffer();
		String line = null;

		while ((line = bReader.readLine()) != null)
			contents.append(line).append("\n");

		bReader.close();

		return contents.toString();
	}

	public static int readInt(InputStream in) throws IOException {
		byte[] bytes = new byte[4];
		in.read(bytes);

		return byteArrayToInt(bytes);
	}

	public static String readStr(InputStream in) throws IOException {
		int length = readInt(in);

		if (length > 0) {
			byte[] bytes = new byte[length];
			int bytesRead = 0;
			while ((bytesRead += in.read(bytes, bytesRead,
					length - bytesRead)) < length) {
			}
			return new String(bytes);
		}

		else
			return null;
	}

	public static String readStr(InputStream in, boolean lengthGiven)
			throws IOException {
		if (!lengthGiven) {

			StringBuffer sb = new StringBuffer();
			byte[] bytes = new byte[4096];
			int bytesRead = in.read(bytes);
			while (bytesRead != -1) {
				sb.append(new String(bytes, 0, bytesRead));
				bytesRead = in.read(bytes);
			}

			return sb.toString();
		} else
			return readStr(in);
	}

	public static float readFloat(InputStream in) throws IOException {
		return Float.valueOf(readStr(in)).floatValue();
	}

	public static double readDouble(InputStream in) throws IOException {
		return Double.valueOf(readStr(in)).doubleValue();
	}

	public static boolean readBool(InputStream in) throws IOException {
		return (in.read() == 1);
	}

	public static void writeToFile(String contents, File file)
			throws IOException {

		writeToFile(contents, file, false);
	}

	public static void writeToFile(String contents, File file, boolean append)
			throws IOException {
		if (!file.exists())
			file.createNewFile();

		FileWriter writer = new FileWriter(file, append);

		writer.write(contents);
		writer.close();
	}

	public static void writeToFile(InputStream in, String filePath)
			throws IOException {
		writeToFile(in, new File(filePath));
	}

	public static void writeToFile(InputStream in, File destFile)
			throws IOException {
		in = new BufferedInputStream(in);
		OutputStream out = new BufferedOutputStream(
				new FileOutputStream(destFile));

		int BUF_SIZE = 8 * 1024;

		byte[] buf = new byte[BUF_SIZE];
		int len;

		while ((len = in.read(buf, 0, BUF_SIZE)) > 0)
			out.write(buf, 0, len);

		in.close();
		out.close();
	}

	public static void write(OutputStream out, int i) throws IOException {
		out.write(intToByteArray(i));
	}

	public static void write(OutputStream out, String str) throws IOException {
		if (str == null) {
			write(out, 0);
		} else {
			byte[] bytes = str.getBytes();

			write(out, bytes.length);
			out.write(bytes);
		}
	}

	public static void write(OutputStream out, String str, boolean giveLength)
			throws IOException {
		if (!giveLength) {
			if (str != null)
				out.write(str.getBytes());
		} else {
			write(out, str);
		}
	}

	public static void writeTo(BufferedReader reader, File file, boolean append)
			throws IOException {
		Writer writer = new FileWriter(file, append);

		String line = null;
		while ((line = reader.readLine()) != null) {
			// System.out.println(line);

			writer.write(line + "\n");
		}

		writer.close();
		reader.close();
	}

	public static void write(OutputStream out, float f) throws IOException {
		write(out, String.valueOf(f));
	}

	public static void write(OutputStream out, double d) throws IOException {
		write(out, String.valueOf(d));
	}

	private static byte[] intToByteArray(int nr) {
		byte[] bytes = new byte[4];
		for (int i = 0; i <= 3; i++) {
			int p = (nr >>> (i * 8));
			bytes[i] = (byte) p;
		}

		return bytes;
	}

	private static int byteArrayToInt(byte[] bytes) {
		int nr = 0;
		int rightOp = 0x000000FF;
		for (int i = 0; i <= 3; i++) {
			rightOp = rightOp << (i * 8);
			int p = (bytes[i] << (i * 8)) & rightOp;
			nr += p;
		}

		return nr;
	}

	public static String readFromStream(InputStream in) throws IOException {
		// FileInputStream fin =
		// (FileInputStream) AndroidQuery.context.
		// getResources().openRawResource();

		byte[] b = new byte[1024];
		int len = 0;
		StringBuffer sb = new StringBuffer();
		while ((len = in.read(b)) != -1) {
			sb.append(new String(b, 0, len));
		}
		String fileStr = sb.toString();

		b = null;
		in.close();
		// sb.delete(0, sb.length());
		sb = null;

		return fileStr;
	}
	
	public static void deleteContents(File folder) throws IOException {
		File[] files = folder.listFiles();
		
		for (File file : files) {
			if (file.isDirectory())
				deleteContents(file);
			
			file.delete();
		}
	}
}
