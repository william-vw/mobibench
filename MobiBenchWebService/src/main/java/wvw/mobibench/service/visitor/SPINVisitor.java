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
package wvw.mobibench.service.visitor;

import java.util.List;

import org.topbraid.spin.model.Bind;
import org.topbraid.spin.model.Element;
import org.topbraid.spin.model.ElementList;
import org.topbraid.spin.model.Exists;
import org.topbraid.spin.model.Minus;
import org.topbraid.spin.model.NamedGraph;
import org.topbraid.spin.model.NotExists;
import org.topbraid.spin.model.Optional;
import org.topbraid.spin.model.Service;
import org.topbraid.spin.model.SubQuery;
import org.topbraid.spin.model.TriplePath;
import org.topbraid.spin.model.Union;
import org.topbraid.spin.model.Values;
import org.topbraid.spin.model.visitor.ElementVisitor;

public abstract class SPINVisitor implements ElementVisitor {

	protected Exception exc;
	
	public void visit(Bind arg0) {
	}

	public void visit(ElementList arg0) {
		List<Element> elements = arg0.getElements();
		for (Element element : elements)
			element.visit(this);
	}

	public void visit(Exists arg0) {
	}

	// public void visit(Filter arg0) {}

	public void visit(Minus arg0) {
	}

	public void visit(NamedGraph arg0) {
	}

	public void visit(NotExists arg0) {
	}

	public void visit(Optional arg0) {
	}

	public void visit(Service arg0) {
	}

	public void visit(SubQuery arg0) {
	}

	public void visit(TriplePath arg0) {
		// System.out.println("TriplePath.visit: " + arg0);
	}

	// public void visit(TriplePattern arg0) {}

	public void visit(Union arg0) {
	}

	public void visit(Values arg0) {
	}
}
