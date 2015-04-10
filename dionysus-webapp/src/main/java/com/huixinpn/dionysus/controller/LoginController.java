package com.huixinpn.dionysus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.huixinpn.dionysus.domain.User;
import com.huixinpn.dionysus.service.UserService;

@RestController
@RequestMapping("/api/v1")
public class LoginController {
	
	private UserService userService;
	
	@Autowired
	public LoginController(UserService service) {
		this.userService = service;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody User login(@RequestBody User user) {
		return userService.sign(user.getUsername(), user.getPassword());
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		if (session != null)
			session.invalidate();
		return "success";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public User register(@RequestBody User user) {
		return userService.register(user);
	}
	
	@RequestMapping(value = "/consultant", method = RequestMethod.POST)
	public User consultant(@RequestBody User user) {
		return userService.notifyuser(user, "Consultant Validation & Register");
	}
}
