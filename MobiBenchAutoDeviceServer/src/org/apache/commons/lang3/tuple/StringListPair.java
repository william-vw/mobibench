package org.apache.commons.lang3.tuple;

import java.util.List;

public class StringListPair extends MutablePair<List<String>, List<String>> {

	private static final long serialVersionUID = -4265427342761423303L;

	public StringListPair() {
	}

	public StringListPair(List<String> list1, List<String> list2) {
		super();

		setLeft(list1);
		setRight(list2);
	}
}
