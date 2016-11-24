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
package wvw.mobibench.config.data;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import wvw.mobibench.config.ResourceConfig;
import wvw.utils.JsonReadable;
import wvw.mobibench.wrap.Carton;
import wvw.mobibench.wrap.Cartonable;

public class DatasetConfig extends ResourceConfig implements Cartonable, JsonReadable {

	private DataFormats dataFormat;
	private RDFSyntaxes rdfSyntax;

	public DataFormats getDataFormat() {
		return dataFormat;
	}

	public void setDataFormat(DataFormats dataFormat) {
		this.dataFormat = dataFormat;
	}

	public RDFSyntaxes getRdfSyntax() {
		return rdfSyntax;
	}

	public void setRdfSyntax(RDFSyntaxes rdfSyntax) {
		this.rdfSyntax = rdfSyntax;
	}

	public boolean hasDataString() {
		return hasString();
	}

	public String getDataString() {
		return getString();
	}

	public void setDataString(String dataStr) {
		setString(dataStr);
	}

	public boolean hasDataList() {
		return hasList();
	}

	public List<String> getDataList() {
		return getList();
	}

	public void setDataList(List<String> dataList) {
		setList(dataList);
	}

	public DatasetConfig(JSONObject obj) throws JSONException {
		fromJson(obj);
	}

	public void toJson(JSONObject obj) throws JSONException {
	}

	public void fromJson(JSONObject obj) throws JSONException {
		super.fromJson(obj);

		if (obj.has("format")) {
			setDataFormat(DataFormats.getEnum(obj.getString("format")));

			if (obj.has("syntax"))
				setRdfSyntax(RDFSyntaxes.getEnum(obj.getString("syntax")));
		}
	}

	public DatasetConfig(Carton in) {
		super(in);

		setDataFormat(DataFormats.getEnum(in.readInt()));
		setRdfSyntax(RDFSyntaxes.getEnum(in.readInt()));
	}

	public void writeTo(Carton dest) {
		super.writeTo(dest);

		dest.writeInt(dataFormat.getId());
		dest.writeInt(rdfSyntax == null ? -1 : rdfSyntax.getId());
	}

	public boolean equals(Object obj) {
		if (obj instanceof DatasetConfig)
			return super.equals(obj);

		return false;
	}

}
