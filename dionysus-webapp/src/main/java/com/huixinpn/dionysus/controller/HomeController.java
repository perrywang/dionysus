package com.huixinpn.dionysus.controller;

import com.huixinpn.dionysus.domain.user.Role;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashSet;
import java.util.Set;

@Controller
public class HomeController {

	@RequestMapping(
		value = { 
			"/", 
			"/app/**",  
			"/about", "/login", "/logout", "/register",
			"/articles/**",
			"/appointments/**",
			"/consultants/**",
			"/courses/**",
			"/error/**",
			"/profile/**",
			"/tests/**",
			"/site/**",
            "/fms/**",
            "/rooms/**",
            "/questions/**",
			"/murmurs/**",
			"/organizations/**",
            "/inbox/**"
		}, 
		method = RequestMethod.GET)
	public String index() {
		return "/index.html";
	}

	@RequestMapping(value = "/admin/**", method = RequestMethod.GET)
	public String admin() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || authentication.getPrincipal() == "anonymousUser"){
            return "/adminlogin.html";
        }

        User login = (User) authentication.getPrincipal();
        Set<Role> roles = login.getRoles();
        for (Role role: roles){
            if(role.getName() == "ROLE_ADMIN"){
                return "/admin.html";
            }
        }

        return "/adminlogin.html";
	}

	@RequestMapping(value = "/consultant/**", method = RequestMethod.GET)
	public String consultant() {
		return "/consultant.html";
	}

    @RequestMapping(value = "/adminlogin/**", method = RequestMethod.GET)
    public String adminlogin() {
        return "/adminlogin.html";
    }
}
