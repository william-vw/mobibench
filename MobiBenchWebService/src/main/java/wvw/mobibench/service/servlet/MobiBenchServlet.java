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
package wvw.mobibench.service.servlet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import wvw.mobibench.service.config.Config;
import wvw.mobibench.service.convert.ConvertConfig;
import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.Converter;
import wvw.mobibench.service.convert.DataConverter;
import wvw.mobibench.service.convert.RuleConverter;
import wvw.mobibench.service.preproc.PreProcessConfig;
import wvw.mobibench.service.preproc.PreProcessException;
import wvw.mobibench.service.preproc.PreProcessResults;
import wvw.mobibench.service.preproc.PreProcessor;
import wvw.mobibench.service.preproc.aux_rules.AuxiliaryRulesPreProcessor;
import wvw.mobibench.service.preproc.ont.binarize.BinarizePreProcessor;
import wvw.mobibench.service.preproc.ont.inst_rules.InstantiateRulesPreProcessor;
import wvw.mobibench.service.res.ServiceResources;
import wvw.mobibench.service.select.RulesetSelectionException;
import wvw.mobibench.service.select.SelectOutput;
import wvw.mobibench.service.select.def.DefaultSelectConfig;
import wvw.mobibench.service.select.def.DefaultSelectConfig.InitSelectConfig;
import wvw.mobibench.service.select.def.DefaultSelection;
import wvw.mobibench.service.select.domain.DomainBasedSelectConfig;
import wvw.mobibench.service.select.domain.DomainBasedSelection;
import wvw.mobibench.service.select.domain.DomainBasedSelectionFactory;
import wvw.mobibench.service.select.domain.DomainSelectTypes;
import wvw.mobibench.service.servlet.msg.ErrorMessage;
import wvw.mobibench.service.servlet.msg.PreProcessResultMsg;
import wvw.mobibench.service.servlet.msg.ResponseTypes;
import wvw.mobibench.service.servlet.msg.SelectionOutputMessage;
import wvw.mobibench.service.servlet.msg.StringResultMessage;
import wvw.mobibench.service.servlet.msg.SuccessMessage;
import wvw.mobibench.service.servlet.msg.serial.EnumDeserializer;
import wvw.mobibench.service.servlet.msg.serial.EnumSerializer;
import wvw.utils.OutputUtils;
import wvw.utils.StreamUtils;
import wvw.utils.log2.Log;
import wvw.utils.log2.target.SystemOutTarget;

public class MobiBenchServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private Gson gson;
	private GsonBuilder gsonBuilder;

	private Map<String, RuleConverter> spin2s = new HashMap<String, RuleConverter>();
	private Map<String, DataConverter> rdf2s = new HashMap<String, DataConverter>();

	private Logger log;

	private ServiceResources res;

	public MobiBenchServlet() {
		super();
	}

	public void init() throws ServletException {
		try {
			initResources();

			initLogger();
			initGson();

			Config.init(res);

			loadConverters("spin2s.txt", spin2s);
			loadConverters("rdf2s.txt", rdf2s);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void initResources() {
		this.res = new ServiceResources(getServletContext());
	}

	private void initLogger() throws IOException {
		Log.setTarget(new SystemOutTarget());

		log = Logger.getLogger(MobiBenchServlet.class.getName());
		Properties properties = new Properties();
		try {
			properties.load(res.getInputStream(("log4j.properties")));
			PropertyConfigurator.configure(properties);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void initGson() {
		gsonBuilder = new GsonBuilder();

		regEnums(ResponseTypes.class, DomainSelectTypes.class);
	}

	@SuppressWarnings("rawtypes")
	private void regEnums(Class... clazzes) {
		// (registering Enum.class doesn't work)
		EnumSerializer enumSerial = new EnumSerializer();
		EnumDeserializer enumDeserial = new EnumDeserializer();

		for (Class clazz : clazzes) {
			gsonBuilder.registerTypeAdapter(clazz, enumSerial);

			gsonBuilder.registerTypeAdapter(clazz, enumDeserial);
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void loadConverters(String fileName, Map convs) {
		try {
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(res.getInputStream(fileName)));

			String line = null;
			while ((line = reader.readLine()) != null) {
				String className = line.trim();

				try {
					Class<?> clazz = Class.forName(className);

					Constructor<?> constr = clazz.getConstructor();
					Converter conv = (Converter) constr.newInstance();

					convs.put(conv.getId(), conv);

				} catch (ClassNotFoundException e) {
					log.error("Error loading converter: converter class "
							+ className + " not found on classpath ("
							+ OutputUtils.toString(e) + ")");

					e.printStackTrace();

				} catch (NoSuchMethodException e) {
					log.error("Error loading converter: no empty constructor "
							+ "found for " + className + " ("
							+ OutputUtils.toString(e) + ")");

					e.printStackTrace();

				} catch (InvocationTargetException e) {
					log.error("Error loading converter for class " + className
							+ ": " + OutputUtils.toString(e));

					e.printStackTrace();

				} catch (IllegalAccessException e) {
					log.error("Error loading converter for class " + className
							+ ": " + OutputUtils.toString(e));

					e.printStackTrace();

				} catch (InstantiationException e) {
					log.error("Error loading converter for class " + className
							+ ": " + OutputUtils.toString(e));

					e.printStackTrace();
				}
			}

			reader.close();

		} catch (IOException e) {
			log.error("Error loading converters: " + OutputUtils.toString(e));

			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			response.getWriter()
					.write("<html>" + "<body>"
							+ "<h1>Welcome to the MobiBench RESTful Web Service!</h1>"
							+ "</body>" + "</html>");

		} catch (IOException e) {
			log.error(
					"Error handling incoming GET: " + OutputUtils.toString(e));

			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		log.info("> Received request");

		gson = gsonBuilder.create();

		String url = request.getRequestURL().toString();
		// log.info("url: " + url);

		if (url.matches(".*?convert/.*?"))
			doConversion(url, request, response);

		else if (url.matches(".*?select/.*?"))
			doSelectRules(url, request, response);

		else if (url.matches(".*?preprocess/.*?"))
			doPreProcess(url, request, response);

		// else if (url.endsWith("gen/match"))
		// doGenerateMatchData(request, response);

		else if (url.endsWith("log/"))
			doLogData(request, response);

		else if (url.endsWith("file/store"))
			doStoreFile(request, response);

		else {
			String errorMsg = "Expected 'convert/(rules|data)', 'select/[default/domain]', "
					+ "'preprocess/(aux_rules|binarize|inst_rules)', 'log/' or 'file/store' in URL";
			log.error(errorMsg);

			response.getWriter().write(gson.toJson(new ErrorMessage(errorMsg)));
		}
	}

	private void doConversion(String url, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if (url.endsWith("rules"))
			doRuleConversion(request, response);

		else if (url.endsWith("data"))
			doDataConversion(request, response);
	}

	private void doRuleConversion(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		log.info(">> Performing rule conversion");

		String errorMsg = null;
		RuleConverter conv = null;

		// NOTE "from" parameter (converting *to* SPIN is future work)
		String from = request.getParameter("from");
		String to = request.getParameter("to");

		boolean includeComments = Boolean
				.valueOf(request.getParameter("includeComments"));

		if (from == null && to == null)
			errorMsg = "Expecting 'from' or 'to' URL parameter";

		else if (from != null) {
			errorMsg = "RuleConverter for '" + from + "' not registered";

		} else if (to != null) {
			conv = spin2s.get(to);

			if (conv == null)
				errorMsg = "RuleConverter for '" + to + "' not registered";
		}

		if (conv != null)
			try {
				String rules = readString(request);
				// Log.d("rules? " + rules);

				String result = (String) conv.convertRules(rules,
						new ConvertConfig(true, includeComments));

				response.getWriter()
						.write(gson.toJson(new StringResultMessage(result)));

				log.info("> Conversion successful, returned result");

			} catch (IOException | ConvertException e) {
				errorMsg = "Error performing rule conversion: "
						+ OutputUtils.toString(e);

				e.printStackTrace();
			}

		if (errorMsg != null) {
			response.getWriter().write(gson.toJson(new ErrorMessage(errorMsg)));

			log.error(errorMsg);
		}
	}

	private void doDataConversion(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		log.info(">> Performing data conversion");

		String errorMsg = null;
		DataConverter conv = null;

		String to = request.getParameter("to");

		if (to == null)
			errorMsg = "Expecting 'to' URL parameter";

		else if (to != null) {
			conv = rdf2s.get(to);

			if (conv == null)
				errorMsg = "DataConverter for '" + to + "' not registered";
		}

		String syntax = request.getParameter("syntax");
		if (syntax == null)
			syntax = defRDFSyntax;
		else
			syntax = syntax.replace("_", "/"); // for RDF/XML

		if (!isSupportedRDFSyntax(syntax))
			errorMsg = "Unsupported RDF syntax; supported syntaxes: "
					+ getSupportedRDFSyntaxes();

		if (errorMsg == null) {
			try {
				String data = readString(request);

				String result = conv.convert(data, syntax);
				// System.out.println("data result:\n" + result);

				response.getWriter()
						.write(gson.toJson(new StringResultMessage(result)));

				log.info(">> Conversion successful, returned result");

			} catch (IOException | ConvertException e) {
				errorMsg = "Error performing data conversion: "
						+ OutputUtils.toString(e);

				e.printStackTrace();
			}
		}

		if (errorMsg != null) {
			response.getWriter().write(gson.toJson(new ErrorMessage(errorMsg)));

			log.error(errorMsg);
		}
	}

	private void doSelectRules(String url, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if (url.endsWith("default"))
			doDefaultSelectRules(request, response);

		else if (url.endsWith("domain"))
			doDomainSelectRules(request, response);
	}

	private void doDefaultSelectRules(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		log.info(">> Selecting rules (default)");

		String errorMsg = null;

		try {
			String json = readString(request);

			DefaultSelectConfig config = new DefaultSelectConfig(
					gson.fromJson(json, InitSelectConfig.class));

			// System.out.println("config: " + config);

			DefaultSelection select = new DefaultSelection();
			SelectOutput output = select.select(config);

			response.getWriter()
					.write(gson.toJson(new SelectionOutputMessage(output)));

			log.info(">> Selection successful, returned result");

		} catch (IOException e) {
			errorMsg = "Error selecting rules: " + OutputUtils.toString(e);

			e.printStackTrace();
		}

		if (errorMsg != null) {
			response.getWriter().write(gson.toJson(new ErrorMessage(errorMsg)));

			log.error(errorMsg);
		}
	}

	private void doDomainSelectRules(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		log.info(">> Selecting rules (domain-specific)");

		String errorMsg = null;

		try {
			String json = readString(request);

			DomainBasedSelectConfig config = gson.fromJson(json,
					DomainBasedSelectConfig.class);
			System.out.println(config);

			DomainBasedSelection select = DomainBasedSelectionFactory
					.create(config);

			String rules = select.select(config).getRules();

			response.getWriter()
					.write(gson.toJson(new StringResultMessage(rules)));

			log.info(">> Selection successful, returned result");

		} catch (IOException | RulesetSelectionException e) {
			errorMsg = "Error selecting rules: " + OutputUtils.toString(e);

			e.printStackTrace();
		}

		if (errorMsg != null) {
			response.getWriter().write(gson.toJson(new ErrorMessage(errorMsg)));

			log.error(errorMsg);
		}
	}

	private void doPreProcess(String url, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String option = url.substring(url.lastIndexOf("/")).replace("/", "");

		log.info(">> Pre-processing (" + option + ")");

		String errorMsg = null;
		PreProcessor processor = null;

		if (option.equals("aux_rules"))
			processor = new AuxiliaryRulesPreProcessor(res);

		else if (option.equals("binarize"))
			processor = new BinarizePreProcessor(res);

		else if (option.equals("inst_rules"))
			processor = new InstantiateRulesPreProcessor(res);

		else
			errorMsg = "Unknown preprocessing option: " + option;

		if (processor != null) {
			PreProcessConfig config = gson.fromJson(readString(request),
					PreProcessConfig.class);

			try {
				PreProcessResults results = processor.preprocess(config);

				response.getWriter()
						.write(gson.toJson(new PreProcessResultMsg(results)));

				log.info(">> Pre-processing successful, returned result");

			} catch (PreProcessException e) {
				errorMsg = "Error pre-processing rules: "
						+ OutputUtils.toString(e);

				e.printStackTrace();
			}
		}

		if (errorMsg != null) {
			response.getWriter().write(gson.toJson(new ErrorMessage(errorMsg)));

			log.error(errorMsg);
		}
	}

	private void doLogData(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		log.info(">> Logging data");

		res.store("log.txt", request.getReader(), true);

		onSuccess(response);
	}

	private void doStoreFile(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String fileName = request.getParameter("fileName");
		boolean append = Boolean.parseBoolean(request.getParameter("append"));

		String path = res.store(fileName, request.getReader(), append);
		log.info(">> Stored file: " + path + " (append? " + append + ")");

		onSuccess(response);
	}

	private Reader getReader(HttpServletRequest request) throws IOException {
		String url = request.getParameter("url");
		String path = request.getParameter("path");

		if (url != null)
			return new InputStreamReader(new URL(url).openStream());

		else if (path != null)
			return new FileReader(path);

		else
			return request.getReader();
	}

	private String readString(HttpServletRequest request) throws IOException {
		return StreamUtils.readString(getReader(request));
	}

	private void onSuccess(HttpServletResponse response) throws IOException {
		response.getWriter().write(gson.toJson(new SuccessMessage()));
	}

	// source:
	// https://jena.apache.org/documentation/javadoc/jena/com/hp/hpl/jena/rdf/model/Model.html
	private static String defRDFSyntax = "RDF/XML";

	private static Map<String, Boolean> rdfSyntaxes = new HashMap<String, Boolean>();

	static {
		rdfSyntaxes.put("RDF/XML", true);
		rdfSyntaxes.put("N-TRIPLE", true);
		rdfSyntaxes.put("TURTLE", true);
		rdfSyntaxes.put("TTL", true);
		rdfSyntaxes.put("N3", true);
		rdfSyntaxes.put("RDF/XML", true);
		rdfSyntaxes.put("RDF/XML-ABBREV", true);
	}

	private boolean isSupportedRDFSyntax(String syntax) {
		return rdfSyntaxes.containsKey(syntax);
	}

	private String getSupportedRDFSyntaxes() {
		return OutputUtils.keysToString(rdfSyntaxes);
	}

	protected void doPut(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	public static void main(String[] args) throws Exception {
		String url = "http://localhost:8080/MobiBenchWebService/preprocess/aux_rules";

		System.out.println(url.matches(".*?preprocess/.*?"));
	}
}
