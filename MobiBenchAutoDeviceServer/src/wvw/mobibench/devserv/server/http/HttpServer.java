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

package wvw.mobibench.devserv.server.http;

import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.Executors;

import org.androidannotations.annotations.Background;

import fi.iki.elonen.NanoHTTPD;
import fi.iki.elonen.NanoHTTPD.Response.Status;
import wvw.mobibench.devserv.server.handler.HandlerException;
import wvw.mobibench.devserv.server.handler.HandlerListener;
import wvw.mobibench.devserv.server.handler.RequestHandler;
import wvw.mobibench.devserv.server.msg.OkMsg;
import wvw.mobibench.devserv.server.msg.ResponseMsg;
import wvw.mobibench.devserv.server.serial.Serializer;
import wvw.utils.IOUtils;
import wvw.utils.log2.Log;

public class HttpServer extends NanoHTTPD implements HandlerListener {

	private RequestHandler handler;
	private Serializer serial = new Serializer();

	public HttpServer(RequestHandler handler, int port) {
		super(port);

		this.handler = handler;
	}

	public Response serve(IHTTPSession session) {
		Method method = session.getMethod();
		String uri = session.getUri();

		String retIp = session.getRemoteIpAddress();
		Log.d("return IP: " + retIp);

		try {
			switch (method) {

			case GET:
				handler.handle(uri, this, retIp);

				break;

			case POST:
				String data = readBody(session);

				handler.handle(uri, data, this, retIp);

				break;

			default:
				Log.i("unsupported method: " + method);

				return newStatusResponse(Status.METHOD_NOT_ALLOWED, "Allow",
						"POST");
			}

		} catch (HandlerException e) {
			Log.e(e);

			return newErrorResponse(e, session);

		} catch (IOException e) {
			Log.e(e);

			return newErrorResponse(e, session);
		}

		return newFixedLengthResponse(serial.serialize(new OkMsg()));
	}

	protected String readBody(IHTTPSession session) throws IOException {
		StringBuffer sb = new StringBuffer();

		byte[] buf = new byte[512];

		int rlen = 0;
		long size = session.getBodySize();
		// Log.d("body size: " + size);

		InputStream in = session.getInputStream();

		while (rlen >= 0 && size > 0) {
			rlen = in.read(buf, 0, (int) Math.min(size, 512));
			size -= rlen;

			if (rlen > 0)
				sb.append(new String(buf, 0, rlen));
		}

		return sb.toString();
	}

	protected Response newErrorResponse(Exception e, IHTTPSession session) {
		Error ret = new Error(e);

		return newFixedLengthResponse(Status.INTERNAL_ERROR,
				NanoHTTPD.MIME_PLAINTEXT, serial.serialize(ret));
	}

	protected static String getOrigin(String url) {
		return url.substring(0, url.indexOf("/"));
	}

	@Background
	public void response(final String url, final ResponseMsg message) {
		Executors.newSingleThreadExecutor().submit(new Runnable() {

			public void run() {
				Log.d("HttpServer.send: " + url);

				try {
					IOUtils.sendPost(url, serial.serialize(message));

				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		});

		// AsyncTask<Void, Void, Void> task = new AsyncTask<Void, Void, Void>()
		// {
		//
		// protected Void doInBackground(Void... voids) {
		// Log.d("HttpServer.send: " + url);
		//
		// try {
		// IOUtils.sendPost(url, serial.serialize(message));
		//
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
		//
		// return null;
		// }
		// };
		//
		// if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
		// task.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR,
		// (Void[]) null);
		// else
		// task.execute((Void[]) null);

		// new Thread(new Runnable() {
		//
		// public void run() {
		// Log.d("HttpServer.send: " + url);
		//
		// try {
		// IOUtils.sendPost(url, serial.serialize(message));
		//
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
		// }
		// }).run();

		// try {
		// IOUtils.sendPost(url, serial.serialize(message));
		//
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
	}
}