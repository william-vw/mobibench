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
package wvw.utils.cmd;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

import wvw.utils.ArrayUtils;
import wvw.utils.StringUtils;

public class CmdUtils {

	private List<Object> processedOptions;

	private HelpFormatter formatter = new HelpFormatter();

	private String execName;
	private CmdOptionListener listener;

	private List<CmdOption> cmdOptions = new ArrayList<CmdOption>();
	private Options options;

	public CmdUtils(String execName, CmdOptionListener listener,
			CmdOption... optionsArray) {

		this.execName = execName;
		this.listener = listener;

		for (CmdOption cmdOption : optionsArray)
			this.cmdOptions.add(cmdOption);

		formatter.setOptionComparator(new Comparator<Option>() {
			
			public int compare(Option o1, Option o2) {
				int idx = cmdOptions.indexOf(find(o1.getOpt()));
				int idx2 = cmdOptions.indexOf(find(o2.getOpt()));
				
				if (idx > idx2)
					return 1;
				else if (idx < idx2)
					return -1;
				else
					return 0;
			}
		});
		
		options = new Options();
		
		for (CmdOption cmdOption : optionsArray)
			options.addOption(cmdOption.getName(), cmdOption.hasArg(),
					cmdOption.getDescription());
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean process(String[] args) {
		if (ArrayUtils.contains(args, "-help")) {
			help();

			return false;
		}

		CommandLineParser parser = new DefaultParser();
		CommandLine cmd = null;

		try {
			cmd = parser.parse(options, args);

		} catch (ParseException e) {
			error(e);

			return false;
		}

		Option[] options = cmd.getOptions();
		for (Option option : options) {

			final String name = option.getOpt();
			CmdOption cmdOption = find(name);

			Object value = option.getValue();			
			if (cmdOption.hasArg()) {

				if (value == null) {
					error("require value for option \"" + name + "\"");

					return false;
				}

				if (cmdOption.hasArgClz()) {

					if (cmdOption.getArgClz().equals(Integer.class)) {
						try {
							value = Integer.parseInt((String) value);

						} catch (NumberFormatException e) {
							error(e);

							return false;
						}

					} else if (cmdOption.getArgClz().equals(Double.class)) {
						try {
							value = Double.parseDouble((String) value);

						} catch (NumberFormatException e) {
							error(e);

							return false;
						}

					} else if (cmdOption.getArgClz().equals(String.class)) {

					} else {
						error("unsupported argument class: " + cmdOption.getArgClzName());

						return false;
					}
				}

				if (cmdOption.getOptions() != null) {

					if (!ArrayUtils.contains(cmdOption.getOptions(), value)) {
						error("unsupported argument \"" + value + "\"");

						return false;
					}
				}
			}

			if (!listener.cmdOptionValue(name, value))
				return false;
		}

		this.processedOptions = new ArrayList(Arrays.asList(options));

		if (!doPostCheck(options))
			return false;

		return true;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean process(CmdOptionVal[] args) {
		for (CmdOptionVal val : args) {

			CmdOption cmdOption = find(val.getName());
			if (cmdOption == null) {
				error("unknown option\"" + val.getName() + "\"");

				return false;
			}

			val.setOption(cmdOption);

			if (cmdOption.hasArg() && val.getValue() == null) {
				error("require value for option \"" + cmdOption.getName() + "\"");

				return false;
			}

			if (cmdOption.getArgClz().equals(Integer.class)) {
				if (!(val.getValue() instanceof Integer)) {
					error("expecting integer for argument \"" + val.getName() + "\"");

					return false;
				}
			} else if (cmdOption.getArgClz().equals(Double.class)) {
				if (!(val.getValue() instanceof Double)) {
					error("expecting double for argument \"" + val.getName() + "\"");

					return false;
				}

			} else if (cmdOption.getArgClz().equals(String.class)) {
				if (!(val.getValue() instanceof String)) {
					error("expecting string for argument \"" + val.getName() + "\"");

					return false;
				}

			} else
				error("unsupported argument class: " + cmdOption.getArgClzName());

			if (cmdOption.getOptions() != null) {

				if (!ArrayUtils.contains(cmdOption.getOptions(), val.getValue())) {

					error("unsupported argument \"" + val.getValue() + "\"");

					return false;
				}
			}

			if (!listener.cmdOptionValue(val.getName(), val.getValue()))
				return false;
		}

		processedOptions = (List) new ArrayList(Arrays.asList(args));

		return doPostCheck(args);
	}

	private CmdOption find(String name) {
		for (CmdOption cmdOption : cmdOptions)
			
			if (cmdOption.getName().equals(name))
				return cmdOption;
			
		return null;
	}

	private boolean doPostCheck(Object[] options) {
		Iterator<CmdOption> optIt = cmdOptions.iterator();
		while (optIt.hasNext()) {
			CmdOption opt = optIt.next();

			if (!inArray(options, opt.getName())) {

				if (opt.isReq()) {
					error("required option \"" + opt.getName() + "\"");

					return false;

				} else if (opt.hasDependencies()) {

					for (OptionDependency dep : opt.getDependencies()) {
						String depName = dep.getName();

						boolean found = false;
						for (String depVal : dep.getValues())
							if (inArray(options, depName, depVal)) {
								found = true;

								break;
							}

						if (found) {
							error("required option \"" + opt.getName() + "\"");

							return false;
						}
					}

				} else if (opt.getDefualt() != null) {
					processedOptions.add(new CmdOptionVal(opt.getName(), opt.getDefualt(), opt));

					if (!listener.cmdOptionValue(opt.getName(), opt.getDefualt()))

						return false;
				}
			}
		}

		return true;
	}

	private boolean inArray(Object[] options, String name) {
		return inArray(options, name, null);
	}

	private boolean inArray(Object[] options, String name, String value) {
		if (options instanceof Option[])
			return inArray((Option[]) options, name, value);

		else if (options instanceof CmdOptionVal[])
			return inArray((CmdOptionVal[]) options, name, value);

		return false;
	}

	private boolean inArray(Option[] options, String name, String value) {
		for (Option option : options)
			if (option.getOpt().equals(name)
					&& (value == null || (option.getValue() != null && option.getValue().equals(value))))

				return true;

		return false;
	}

	private boolean inArray(CmdOptionVal[] options, String name, String value) {
		for (CmdOptionVal option : options)
			if (option.getName().equals(name)
					&& (value == null || (option.getValue() != null && option.getValue().equals(value))))

				return true;

		return false;
	}

	public void error(Exception e) {
		System.err.println(StringUtils.toString(e));

		help();
	}

	public void error(String msg) {
		System.err.println(msg);

		help();
	}

	private void help() {
		formatter.printHelp(execName, options);
	}

	public String toString() {
		StringBuffer ret = new StringBuffer();
		ret.append("- parameters:\n");

		int cnt = 0;
		for (Object obj : processedOptions) {

			if (cnt++ > 0)
				ret.append("\n");

			if (obj instanceof Option) {
				Option option = (Option) obj;

				if (option.hasArg())
					ret.append(option.getOpt() + " : " + option.getValue());
				else
					ret.append(option.getOpt());

			} else if (obj instanceof CmdOptionVal) {
				CmdOptionVal option = (CmdOptionVal) obj;

				if (option.getOption().hasArg())
					ret.append(option.getName() + " : " + option.getValue());
				else
					ret.append(option.getName());
			}
		}

		ret.append("\n");

		return ret.toString();
	}
}
