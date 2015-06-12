package com.huixinpn.dionysus.controller;

import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.service.ConsultantService;
import com.huixinpn.dionysus.service.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpRequestResponseHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/v1")
public class LoginController {

  private static Logger logger = LoggerFactory.getLogger(LoginController.class);
  private UserService userService;
  private ConsultantService consultantService;

  private HttpSessionSecurityContextRepository sessionSecurityContextRepository = new HttpSessionSecurityContextRepository();

  @Autowired
  public LoginController(UserService userservice, ConsultantService consultantservice) {
    this.userService = userservice;
    this.consultantService = consultantservice;
  }

  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public
  @ResponseBody
  User login(@RequestBody User user, HttpServletRequest request, HttpServletResponse response) {

    User loginedUser = userService.sign(user.getUsername(), user.getPassword());
    UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(loginedUser, user.getPassword(), loginedUser.getAuthorities());
    auth.setDetails(loginedUser.getId());
    SecurityContext context = SecurityContextHolder.getContext();
    context.setAuthentication(auth);
    HttpRequestResponseHolder requestResponseHolder = new HttpRequestResponseHolder(request, response);
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
  public User consultant(@RequestBody User consultant) {
    return consultantService.registerconsultant(consultant);
  }
  
  @RequestMapping(value = "/updateprofile", method = RequestMethod.POST)
  public User updateprofile(@RequestBody User user) {
    return userService.updateprofile(user);
  }
}
