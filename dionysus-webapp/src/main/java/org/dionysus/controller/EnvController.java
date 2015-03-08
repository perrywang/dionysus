package org.dionysus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EnvController {

	@Autowired
	private Environment env;

	@RequestMapping("/print/env/{name}")
	@ResponseBody
	public String printEnv(@PathVariable String name) {
		String path = env.getProperty(name);
		return path;
	}
}
