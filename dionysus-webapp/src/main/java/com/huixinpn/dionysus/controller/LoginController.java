package com.huixinpn.dionysus.controller;

import com.huixinpn.dionysus.domain.User;
import com.huixinpn.dionysus.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpRequestResponseHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/v1")
public class LoginController {

  private static Logger logger = LoggerFactory.getLogger(LoginController.class);
  private UserService userService;

  private HttpSessionSecurityContextRepository sessionSecurityContextRepository = new HttpSessionSecurityContextRepository();

  @Autowired
  public LoginController(UserService service) {
    this.userService = service;
  }

  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public
  @ResponseBody
  User login(@RequestBody User user, HttpServletRequest request, HttpServletResponse response) {

    User loginedUser = userService.sign(user.getUsername(), user.getPassword());
    UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), loginedUser.getAuthorities());
    SecurityContext context = SecurityContextHolder.getContext();
    context.setAuthentication(auth);
    HttpRequestResponseHolder requestResponseHolder = new HttpRequestResponseHolder(request, response);
    sessionSecurityContextRepository.loadContext(requestResponseHolder);
    sessionSecurityContextRepository.saveContext(context, requestResponseHolder.getRequest(), requestResponseHolder.getResponse());
    return loginedUser;

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
