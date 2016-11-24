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

package wvw.mobibench.call.plugins;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONObject;

import wvw.utils.log2.Log;

public class KeyValueDbPlugin {

	private static PreparedStatement CREATE_DB;
	private static PreparedStatement CREATE_TABLE;
	private static PreparedStatement EXISTS;
	private static PreparedStatement INSERT;
	private static PreparedStatement UPDATE;
	private static PreparedStatement RETRIEVE;

	private static Connection conn;

	private static String URL = "jdbc:mysql://localhost:3306?useSSL=false";
	private static String USER = "root";
	private static String PWD = "changeit";

	private static void open() {
		if (conn != null)
			return;

		try {
			// Class.forName("com.mysql.jdbc.Driver");

			Log.d("connecting to db server");
			conn = DriverManager.getConnection(URL, USER, PWD);

			initStmts();
			createDb();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void initStmts() {
		try {
			CREATE_DB = conn.prepareStatement("CREATE DATABASE IF NOT EXISTS mobibench");
			CREATE_TABLE = conn.prepareStatement(
					"CREATE TABLE IF NOT EXISTS mobibench.key_value (`key` VARCHAR(100), `value` LONGTEXT, PRIMARY KEY(`key`))");
			EXISTS = conn.prepareStatement("SELECT COUNT(*) FROM mobibench.key_value WHERE `key` LIKE ?");
			INSERT = conn.prepareStatement("INSERT INTO mobibench.key_value (`key`, `value`) VALUES (?, ?)");
			UPDATE = conn.prepareStatement("UPDATE mobibench.key_value SET `value` = ? WHERE `key` LIKE ?");
			RETRIEVE = conn.prepareStatement("SELECT `value` FROM mobibench.key_value WHERE `key` LIKE ?");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void createDb() {
		try {
			CREATE_DB.execute();
			CREATE_TABLE.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void store(String key, String value) {
		open();

		try {
			if (exists(key)) {
				UPDATE.setString(1, value);
				UPDATE.setString(2, key);

				UPDATE.executeUpdate();

			} else {
				INSERT.setString(1, key);
				INSERT.setString(2, value);

				INSERT.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static boolean exists(String key) {
		open();

		try {
			EXISTS.setString(1, key);

			ResultSet res = EXISTS.executeQuery();
			res.next();

			return (res.getInt(1) > 0);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public static String retrieve(String key) {
		open();

		JSONObject ret = new JSONObject();
		try {
			RETRIEVE.setString(1, key);

			ResultSet res = RETRIEVE.executeQuery();
			if (res.next()) {
				String value = res.getString(1);

				ret.put("value", value);

			} else
				ret.put("value", "");

		} catch (SQLException e) {
			e.printStackTrace();

			ret.put("value", "");
		}
		
		return ret.toString();
	}
}
