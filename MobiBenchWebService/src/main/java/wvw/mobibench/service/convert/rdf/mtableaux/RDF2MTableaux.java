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
package wvw.mobibench.service.convert.rdf.mtableaux;

import java.io.File;
import java.io.IOException;

import mtableaux.loader.rdfloader.RDFConsumer;
import mtableaux.loader.rdfloader.RDFReader;
import mtableaux.loader.rdfloader.RDFReaderFactory;
import mtableaux.loader.rdfloader.RDFReaderSpec;

import org.xml.sax.SAXException;

import wvw.mobibench.service.convert.ConvertException;
import wvw.mobibench.service.convert.DataConverter;
import wvw.utils.IOUtils;

import com.hp.hpl.jena.rdf.model.RDFNode;

public class RDF2MTableaux extends DataConverter {

	public RDF2MTableaux() {
		super("mTableaux");
	}

	public String convert(String contents, String syntax)
			throws ConvertException {

		try {
			System.out.println("contents? " + contents);

			File owlFile = new File("mtableaux.owl");
			IOUtils.writeToFile(contents, owlFile);

			File txtFile = new File("mtableaux.txt");
			System.out.println("txtFile: " + txtFile.getAbsolutePath());

			RDFReader reader = RDFReaderFactory.createARPReader(RDFReaderSpec
					.createFileWriterConsumer(txtFile.getAbsolutePath()));

			RDFConsumer consumer = reader.getSpec().getConsumer();
			// should always be the case
			if (consumer instanceof mtableaux.loader.rdfloader.RDFFileWriterConsumerImpl)
				reader.read("file:///" + owlFile.getAbsolutePath());

			contents = IOUtils.readFromFile(txtFile);

			owlFile.delete();
			txtFile.delete();

			return contents;

		} catch (IOException | SAXException e) {
			throw new ConvertException("Error coverting data", e);
		}

	}

	protected String getLineSeparator() {
		return ".\n";
	}

	public String convert(RDFNode[] nodes) throws ConvertException {
		throw new UnsupportedOperationException();
	}

}
