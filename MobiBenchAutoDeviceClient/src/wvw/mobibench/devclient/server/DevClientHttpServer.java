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

package wvw.mobibench.devclient.server;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

import wvw.mobibench.devserv.server.handler.HandlerException;
import wvw.mobibench.devserv.server.handler.HandlerListener;
import wvw.mobibench.devserv.server.handler.RequestHandler;
import wvw.mobibench.devserv.server.msg.ResponseMsg;
import wvw.mobibench.devserv.server.serial.Serializer;
import wvw.utils.IOUtils;
import wvw.utils.log2.Log;

public class DevClientHttpServer implements HttpHandler, HandlerListener {

	private enum ResponseTypes {
		OK(200), INTERNAL_SERVER_ERROR(500), METHOD_NOT_ALLOWED(405);

		private int code;

		private ResponseTypes(int code) {
			this.code = code;
		}

		public int getCode() {
			return code;
		}
	}

	private HttpServer server;

	private RequestHandler handler;
	private Serializer serial = new Serializer();

	public DevClientHttpServer(RequestHandler handler, int port) {
		try {
			server = HttpServer.create(new InetSocketAddress(port), 0);
			server.createContext("/MobiBenchAutoDeviceClient", this);
			server.setExecutor(null);

			this.handler = handler;

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void start() {
		server.start();
	}
	
	public void stop() {
		server.stop(0);
	}

	public void handle(HttpExchange t) {
		String method = t.getRequestMethod().toLowerCase();
		String uri = t.getRequestURI().toString();

		try {
			if (method.equals("post")) {
				handler.handle(uri, getBody(t), this);

			} else if (method.equals("get")) {
				respondOk("<h1>Welcome to AutoBenchmarkDeviceClient!</h1>", t);

			} else {
				Log.i("unsupported method: " + method);

				respond(ResponseTypes.METHOD_NOT_ALLOWED, t);
			}

		} catch (IOException | HandlerException e) {
			e.printStackTrace();

			try {
				respond(ResponseTypes.INTERNAL_SERVER_ERROR, e, t);

			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	private String getBody(HttpExchange t) throws IOException {
		return IOUtils.readFromStream(t.getRequestBody());
	}

	private void respond(ResponseTypes type, HttpExchange t)
			throws IOException {

		t.sendResponseHeaders(type.getCode(), 0);
	}

	private void respondOk(String msg, HttpExchange t) throws IOException {
		respond(ResponseTypes.OK, msg, t);
	}

	private void respond(ResponseTypes type, Object msg, HttpExchange t)
			throws IOException {
		String str = serial.serialize(msg);

		respond(type, str, t);
	}

	private void respond(ResponseTypes type, String msg, HttpExchange t)
			throws IOException {

		t.sendResponseHeaders(type.getCode(), msg.length());

		respond(msg, t);
	}

	private void respond(String msg, HttpExchange t) throws IOException {
		OutputStream os = t.getResponseBody();
		os.write(msg.getBytes());

		os.close();
	}

	public void response(String url, ResponseMsg message) {

	}

	// public Response serve(IHTTPSession session) {
	// Method method = session.getMethod();
	// String uri = session.getUri();
	//
	// try {
	// switch (method) {
	//
	// case GET:
	// return newFixedLengthResponse(
	// "<h1>Welcome to AutoBenchmarkDeviceClient!</h1>");
	//
	// case POST:
	// String data = readBody(session);
	// handler.handle(uri, data, this);
	//
	// return newFixedLengthResponse(serial.serialize(new OkMsg()));
	//
	// default:
	// Log.i("unsupported method: " + method);
	//
	// return newStatusResponse(Status.METHOD_NOT_ALLOWED, "Allow",
	// "POST");
	// }
	//
	// } catch (HandlerException e) {
	// Log.e(e);
	//
	// return newErrorResponse(e, session);
	//
	// } catch (IOException e) {
	// Log.e(e);
	//
	// return newErrorResponse(e, session);
	// }
	// }
	//
	// protected String readBody(IHTTPSession session) throws IOException {
	// // return IOUtils.readStr(session.getInputStream());
	//
	// InputStream in = session.getInputStream();
	//
	// StringBuffer sb = new StringBuffer();
	// byte[] bytes = new byte[1024];
	//
	// int read = 0;
	// while ((read = in.read(bytes)) > 0) {
	// sb.append(new String(bytes, 0, read));
	//
	// if (in.available() == 0)
	// break;
	// }
	//
	// return sb.toString();
	// }
	//
	// protected Response newErrorResponse(Exception e, IHTTPSession session) {
	// Error ret = new Error(e);
	//
	// return newFixedLengthResponse(Status.INTERNAL_ERROR,
	// NanoHTTPD.MIME_PLAINTEXT, serial.serialize(ret));
	// }
	//
	// protected static String getOrigin(String url) {
	// return url.substring(0, url.indexOf("/"));
	// }
	//
	// public void response(String url, ResponseMsg message) {
	// try {
	// NetUtils.sendPost(url, serial.serialize(message));
	//
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// }
}