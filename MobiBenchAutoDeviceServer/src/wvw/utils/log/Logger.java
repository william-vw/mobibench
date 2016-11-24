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

package wvw.utils.log;

import java.util.HashMap;
import java.util.Map;

public abstract class Logger {

	public static final int INFO = 0;
	public static final int DEBUG = 1;
	public static final int EXP = 2;

	private static int nextId = 0;

	private static int defaultLvl = INFO;
	private static int curLogLvl;

	private static int defaultType;

	private static Map<Integer, Logger> instances = new HashMap<Integer, Logger>();

	private int loggerType;

	static {
		instances.put(FileLogger.TYPE, new FileLogger());
	}

	public static Logger getLogger() {
		return getLogger(defaultType);
	}

	public static Logger getLogger(int loggerType) {
		return instances.get(loggerType);
	}

	public static void setDefaultType(int loggerType) {
		defaultType = loggerType;
	}

	public static void addInstance(int loggerType, Logger instance) {
		instances.put(loggerType, instance);
	}

	public static void setLogLevel(int logLvl) {
		curLogLvl = logLvl;
	}

	protected static int getUniqueLoggerTypeId() {
		return nextId++;
	}

	public int getLoggerType() {
		return loggerType;
	}

	protected Logger(int loggerType) {
		this.loggerType = loggerType;
	}

	public void log() {
		log(defaultLvl);
	}

	public void log(int logLvl) {
		log("", logLvl);
	}

	public void log(Object msg) {
		log(msg, defaultLvl);
	}

	public void log(Object msg, int logLvl) {
		log(msg.toString(), logLvl);
	}

	public void log(Exception e) {
		log(e, defaultLvl);
	}

	public void log(Exception e, int logLvl) {
		log(excStr(e), logLvl);
	}

	public void log(String ID, String msg) {
		log(ID, msg, defaultLvl);
	}

	public void log(String ID, String msg, int logLvl) {
		log(ID + ": " + msg, logLvl);
	}

	public void log(Object obj, String msg) {
		log(obj, msg, defaultLvl);
	}

	public void log(Object obj, String msg, int logLvl) {
		log(objStr(obj) + ": " + msg, logLvl);
	}

	public void log(Object obj, Exception e) {
		log(obj, e, defaultLvl);
	}

	public void log(Object obj, Exception e, int logLvl) {
		log(objStr(obj) + " " + excStr(e), logLvl);
	}

	public void log(String msg, Exception e) {
		log(msg + "; " + excStr(e), defaultLvl);
	}

	public void log(Object obj, String msg, Exception e) {
		log(obj, msg, e, defaultLvl);
	}

	public void log(Object obj, String msg, Exception e, int logLvl) {
		log(objStr(obj) + ": " + msg + "; " + excStr(e), logLvl);
	}

	public void log(String msg) {
		log(msg, defaultLvl);
	}

	public void log(String msg, int logLvl) {
		if (logLvl <= curLogLvl)
			logString(msg);
	}

	private String objStr(Object obj) {
		return "[" + obj.getClass().toString().substring(6) + "]";
	}

	private String excStr(Exception e) {
		return "Exception: (" + e.getClass() + ") " + e.getMessage();
	}

	protected abstract void logString(String str);
}
