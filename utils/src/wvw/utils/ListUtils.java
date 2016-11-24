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

package wvw.utils;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class ListUtils {

	public static List reverse(List lst) {
		List lst2 = new ArrayList(lst.size());

		for (int i = lst.size() - 1; i >= 0; i--)
			lst2.add(lst.get(i));

		return lst2;
	}

	public static boolean equals(List lst1, List lst2) {
		if (lst1.size() != lst2.size())
			return false;

		for (Object obj1 : lst1) {

			boolean match = false;
			for (Object obj2 : lst2) {

				if (obj1.equals(obj2)) {
					match = true;

					break;
				}
			}

			if (!match)
				return false;
		}

		return true;
	}

	public static List copyShallow(List lst) {
		List lstCopy = new ArrayList(lst.size());
		for (int i = 0; i < lst.size(); i++)
			lstCopy.add(lst.get(i));

		return lstCopy;
	}

	public static boolean contains(List lsttor, Object val) {
		for (int i = 0; i < lsttor.size(); i++)
			if (lsttor.get(i).equals(val))
				return true;

		return false;
	}

	public static void addAll(List fromList, List toList) {
		addAll(fromList, toList, false);
	}

	public static void addAll(List fromList, List toList, boolean checkDupl) {
		for (int i = 0; i < fromList.size(); i++) {
			Object obj = fromList.get(i);
			if (!checkDupl || !contains(toList, obj))
				toList.add(obj);
		}
	}

	public static void intersect(List lst1, List lst2) {
		for (int i = 0; i < lst1.size(); i++) {
			Object obj1 = lst1.get(i);

			if (!lst2.contains(obj1))
				lst1.remove(i--);
		}
	}

	public static List carthProduct(List lsts) {
		List carthProds = new ArrayList();
		carthProds.add(new ArrayList());

		for (int i = 0; i < lsts.size(); i++) {
			List lst = (List) lsts.get(i);

			List newCarthProds = new ArrayList();
			for (int k = 0; k < carthProds.size(); k++) {
				List carthProd = (List) carthProds.get(k);

				if (lst.size() == 0)
					carthProd.add(null);
				else {
					for (int j = 0; j < lst.size(); j++) {

						List carthProd2 = new ArrayList();
						carthProd2.addAll(carthProd);

						carthProd2.add(lst.get(j));

						newCarthProds.add(carthProd2);
					}

					carthProds.remove(k--);
				}
			}

			carthProds.addAll(newCarthProds);
		}

		return carthProds;
	}

	public static void init(List lst, int size, int el) {
		while (size-- > 0)
			lst.add(el);
	}
}
