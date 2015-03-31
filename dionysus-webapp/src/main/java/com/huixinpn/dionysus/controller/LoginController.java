package com.huixinpn.dionysus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.huixinpn.dionysus.domain.User;
import com.huixinpn.dionysus.service.UserService;

@Controller
public class LoginController {

	private UserService userService;

	@Autowired
	public LoginController(UserService service) {
		this.userService = service;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(@RequestBody User user) {
		
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public boolean logout() {
		return true;
	}

	@RequestMapping(value = "/validate/users", method = RequestMethod.POST)
	public boolean validate(@RequestBody User user) {
		return userService.userValidation(
				user.getUsername(),
				user.getPassword());
	}
}
