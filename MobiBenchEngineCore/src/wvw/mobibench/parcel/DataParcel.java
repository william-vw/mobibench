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
package wvw.mobibench.parcel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.List;
import java.util.UUID;

import wvw.mobibench.wrap.Env;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;
import wvw.utils.IOUtils;
import wvw.utils.log2.Log;

public abstract class DataParcel implements Cartonable {

	protected boolean hasString() {
		return false;
	}

	protected String getString() {
		return null;
	}

	protected void setString(String dataStr) {
	}

	protected boolean hasList() {
		return false;
	}

	protected List<String> getList() {
		return null;
	}

	protected void setList(List<String> dataList) {
	}

	public void toFile(Carton dest) throws IOException {
		dest.writeString(toFile());
	}

	public String toFile() throws IOException {
		return toFile(false);
	}

	public String toFile(boolean raw) throws IOException {
		String fileName = UUID.randomUUID().toString();
		// String fileName = "dataParcel" + fileCnt++;

		File file = new File(Env.getFilesDir(), fileName);
		// File file = new File(Environment.getExternalStorageDirectory(),
		// fileName);

		if (file.exists())
			Log.d("DataParcel.toFile.delete: " + file.delete());

		if (hasString()) {
			FileWriter writer = new FileWriter(file, false);
			if (!raw)
				writer.write(0);

			writer.write(getString());
			writer.close();

		} else {
			FileOutputStream fos = new FileOutputStream(file, false);
			if (!raw)
				fos.write(1);

			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(getList());

			oos.close();
			fos.close();
		}

		// Log.d("saved file to: " + file.getPath());

		return file.getPath();
	}

	public void fromFile(Carton in) throws IOException {
		fromFile(in.readString());
	}

	public void fromFile(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(path);

		fromFile(fis);

		file.delete();
	}

	@SuppressWarnings("unchecked")
	public void fromFile(InputStream in) throws IOException {
		int type = in.read();
		switch (type) {
		case 0:
			setString(IOUtils.readFromStream(in));

			break;

		case 1:
			ObjectInputStream ois = new ObjectInputStream(in);

			try {
				setList((List<String>) ois.readObject());

			} catch (ClassNotFoundException e) {
				throw new IOException(e.getMessage());

			} finally {
				ois.close();

				in.close();
			}

			break;
		}
	}
}
