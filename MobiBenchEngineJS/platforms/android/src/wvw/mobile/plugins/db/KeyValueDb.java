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

package wvw.mobile.plugins.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class KeyValueDb extends SQLiteOpenHelper {

	private static String DATABASE_NAME = "KeyValueDB";
	private static int DATABASE_VERSION = 1;

	public KeyValueDb(Context context) {
		super(context, DATABASE_NAME, null, DATABASE_VERSION);
	}

	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE data (key TEXT PRIMARY KEY, value TEXT)");
	}

	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
	}

	public void store(String key, String value) {
		SQLiteDatabase db = getWritableDatabase();

		ContentValues values = new ContentValues();
		values.put("key", key);
		values.put("value", value);

		String value2 = doRetrieve(key, db);
		if (value2.equals(""))
			db.insert("data", null, values);
		else
			db.update("data", values, "key = ?", new String[] { key });

		db.close();
	}

	public String retrieve(String key) {
		SQLiteDatabase db = getReadableDatabase();
		String value = doRetrieve(key, db);

		db.close();

		return value;
	}
	
	private String doRetrieve(String key, SQLiteDatabase db) {
		Cursor cursor = db.query("data", new String[] { "value" }, "key = ?", new String[] { key },
				null, null, null);

		String value = "";

		if (cursor.moveToFirst())
			value = cursor.getString(0);
		
		return value;
	}
}
