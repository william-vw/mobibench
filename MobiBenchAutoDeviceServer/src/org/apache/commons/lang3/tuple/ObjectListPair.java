package org.apache.commons.lang3.tuple;

import java.util.List;

public class ObjectListPair extends MutablePair<List<Object>, List<Object>> {

	private static final long serialVersionUID = -4265427342761423303L;

	public ObjectListPair() {
	}

	public ObjectListPair(List<Object> list1, List<Object> list2) {
		super();

		setLeft(list1);
		setRight(list2);
	}
}
