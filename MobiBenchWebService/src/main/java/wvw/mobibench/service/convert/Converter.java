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
package wvw.mobibench.service.convert;


public abstract class Converter {

	private String id;

//	protected Logger log;
//	protected Configuration config;

	public Converter(String id) {
		this.id = id;

//		initLogger();
//		loadConfig();
	}

	public String getId() {
		return id;
	}

//	private void initLogger() {
//		log = Logger.getLogger(ConvertServlet.class.getName());
//
//		Properties properties = new Properties();
//		try {
//			properties.load(new FileInputStream(Config.path
//					+ "log4j.properties"));
//			PropertyConfigurator.configure(properties);
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	private void loadConfig() {
//		try {
//			config = new PropertiesConfiguration(Config.path
//					+ "convert.properties");
//
//		} catch (ConfigurationException e) {
//			log.error("Error loading config: " + OutputUtils.toString(e));
//
//			e.printStackTrace();
//		}
//	}
}
