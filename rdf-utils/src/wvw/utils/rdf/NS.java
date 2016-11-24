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

package wvw.utils.rdf;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class NS {
    
	public static Map<String, String> map;
	
	static {
		map = new HashMap<String, String>();
		
		map.put("rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#");
		map.put("rdfs","http://www.w3.org/2000/01/rdf-schema#");
		map.put("owl", "http://www.w3.org/2002/07/owl#");
		map.put("user", "http://wvw.ca/ns/user-model#");
		map.put("prox", "http://wvw.ca/ns/proximity-model#");
		map.put("time", "http://wvw.ca/ns/time#");
		map.put("state", "http://wvw.ca/ns/env-state-model#");
		map.put("cds", "http://wvw.ca/ns/cds#");
		map.put("local", "http://127.0.0.1/");
		map.put("niche", "http://niche.cs.dal.ca/owl/");
		map.put("owls_process", "http://www.daml.org/services/owl-s/1.1/Process.owl#");
	}
	
    public static String rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
	public static String rdfs = "http://www.w3.org/2000/01/rdf-schema#";
	public static String owl = "http://www.w3.org/2002/07/owl#";
	public static String user = "http://wvw.ca/ns/user-model#";
	public static String prox = "http://wvw.ca/ns/proximity-model#";
	public static String time = "http://wvw.ca/ns/time#";
	public static String state = "http://wvw.ca/ns/env-state-model#";
	public static String cds = "http://wvw.ca/ns/cds#";
	public static String local = "http://127.0.0.1/";
	public static String niche = "http://niche.cs.dal.ca/owl/";
	public static String owls_process = "http://www.daml.org/services/owl-s/1.1/Process.owl#";
	
	public static String collapse(String uri) {
		Iterator<String> nsIt = map.keySet().iterator();
		while (nsIt.hasNext()) {
			String prefix = nsIt.next();
			String ns = map.get(prefix);
			
			if (uri.contains(ns))
				return uri.replace(ns, prefix + ":");
		}
		
		return uri;
	}
	
	public static String uncollapse(String uri) {
		Iterator<String> nsIt = map.keySet().iterator();
		while (nsIt.hasNext()) {
			String prefix = nsIt.next();
			String ns = map.get(prefix);
			
			if (uri.contains(prefix))
				return uri.replace(prefix + ":", ns);
		}
		
		return uri;
	}
	
	public static boolean containsNsUri(String uri) {
		Iterator<String> nsIt = map.keySet().iterator();
		while (nsIt.hasNext()) {
			String prefix = nsIt.next();
			String ns = map.get(prefix);
			
			if (uri.startsWith(ns))
				return true;
		}
		
		return false;
	}
	
	public static boolean containsNsPrefix(String qName) {
		Iterator<String> nsIt = map.keySet().iterator();
		while (nsIt.hasNext()) {
			String prefix = nsIt.next();
			
			if (qName.startsWith(prefix + ":"))
				return true;
		}
		
		return false;
	}
	
	public static String getLocalName(String uri) {
		int idx = uri.lastIndexOf("/");
		int idx2 = uri.lastIndexOf("#");
		
		if (idx2 > idx)
			return uri.substring(idx2 + 1);
		else
			return uri.substring(idx + 1);
	}
}
