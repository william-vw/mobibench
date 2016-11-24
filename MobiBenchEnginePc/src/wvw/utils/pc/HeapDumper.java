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

package wvw.utils.pc;

import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;

import javax.management.MBeanServer;

// courtesy of
// https://blogs.oracle.com/sundararajan/entry/programmatically_dumping_heap_from_java
// http://stackoverflow.com/questions/12295824/create-heap-dump-from-within-application-without-hotspotdiagnosticmxbean
@SuppressWarnings({ "unchecked", "rawtypes" })
public class HeapDumper {
	// This is the name of the HotSpot Diagnostic MBean
	private static final String HOTSPOT_BEAN_NAME = "com.sun.management:type=HotSpotDiagnostic";

	// field to store the hotspot diagnostic MBean
	private static volatile Object hotspotMBean;

	/**
	 * Call this method from your application whenever you want to dump the heap
	 * snapshot into a file.
	 *
	 * @param fileName
	 *            name of the heap dump file
	 * @param live
	 *            flag that tells whether to dump only the live objects
	 */
	public static void dumpHeap(String fileName, boolean live) {
		// initialize hotspot diagnostic MBean
		initHotspotMBean();
		try {
			Class clazz = Class.forName("com.sun.management.HotSpotDiagnosticMXBean");
			Method m = clazz.getMethod("dumpHeap", String.class, boolean.class);
			m.invoke(hotspotMBean, fileName, live);
		} catch (RuntimeException re) {
			throw re;
		} catch (Exception exp) {
			throw new RuntimeException(exp);
		}
	}

	// initialize the hotspot diagnostic MBean field
	private static void initHotspotMBean() {
		if (hotspotMBean == null) {
			synchronized (HeapDumper.class) {
				if (hotspotMBean == null) {
					hotspotMBean = getHotspotMBean();
				}
			}
		}
	}

	// get the hotspot diagnostic MBean from the
	// platform MBean server
	private static Object getHotspotMBean() {
		try {
			Class clazz = Class.forName("com.sun.management.HotSpotDiagnosticMXBean");
			MBeanServer server = ManagementFactory.getPlatformMBeanServer();
			Object bean = ManagementFactory.newPlatformMXBeanProxy(server, HOTSPOT_BEAN_NAME, clazz);
			return bean;
		} catch (RuntimeException re) {
			throw re;
		} catch (Exception exp) {
			throw new RuntimeException(exp);
		}
	}

	public static void main(String[] args) {
		// default heap dump file name
		String fileName = "D:\\heap.bin";
		// by default dump only the live objects
		boolean live = true;

		// simple command line options
		switch (args.length) {
		case 2:
			live = args[1].equals("true");
		case 1:
			fileName = args[0];
		}

		// dump the heap
		dumpHeap(fileName, live);
	}
}
