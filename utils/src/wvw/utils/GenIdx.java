package wvw.utils;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GenIdx {

	public static void main(String[] args) throws Exception {
		GenIdx gen = new GenIdx();

		gen.genIdxs(new File("C:/Users/William/git/mobibench/web/code"));
		gen.genIdxs(new File("C:/Users/William/git/mobibench/web/res"));
		gen.genIdxs(new File("C:/Users/William/git/mobibench/web/results"));
	}

	public void genIdxs(File folder) throws IOException {
		List<String> dirs = new ArrayList<String>();
		List<String> fls = new ArrayList<String>();
		List<Long> sizes = new ArrayList<Long>();

		for (File file : folder.listFiles()) {

			if (file.isDirectory()) {
				genIdxs(file);

				dirs.add(file.getName());

			} else {
				if (!file.getName().equals("index.html")) {
					fls.add(file.getName());

					sizes.add(file.length());
				}
			}
		}

		if (dirs.size() > 0 || fls.size() > 0) {
			StringBuffer str = new StringBuffer();
			str.append("<html><head></head><body><h1>Directory contents</h1><ul>");

			for (String dir : dirs) {
				str.append("<li><a href=\"").append(dir).append("/index.html\">").append(dir).append("/</a>")
						.append("</li>");
			}

			Iterator<String> flsIt = fls.iterator();
			Iterator<Long> sizeIt = sizes.iterator();
			while (flsIt.hasNext()) {
				String fl = flsIt.next();
				double size = sizeIt.next();

				String displaySize;

				size = size / 1024;
				if (size > 1024) {
					size = size / 1024;

					DecimalFormat f = new DecimalFormat("#.#");
					displaySize = f.format(size) + " Mb";

				} else
					displaySize = Math.round(size) + " Kb";

				str.append("<li><a href=\"").append(fl).append("\">").append(fl).append("</a>").append(" (")
						.append(displaySize).append(")</li>");
			}

			str.append("</ul></body></html>");

			System.out.println(folder.getAbsolutePath());
			System.out.println(str);
			System.out.println();

			IOUtils.writeToFile(str.toString(), new File(folder, "index.html"));
		}
	}
}
