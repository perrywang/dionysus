package com.huixinpn.dionysus;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

  @Override
  protected void configure(HttpSecurity http) throws Exception {
	    http.csrf().disable()
        .authorizeRequests()
        .antMatchers(HttpMethod.GET, "/", "/themes/**", "/public/**", "/styles/**", "/fonts/**", "/images/**", "/scripts/**").permitAll()
        .antMatchers(HttpMethod.GET, "/api/v1/consultants/**").permitAll()
        .antMatchers(HttpMethod.PUT, "/api/v1/consultants/**").permitAll()
        .antMatchers(HttpMethod.PUT, "/api/v1/profiles/**").permitAll()
        .antMatchers(HttpMethod.POST, "/api/v1/login").permitAll()
        .antMatchers(HttpMethod.POST, "/api/v1/register").permitAll()
        .antMatchers(HttpMethod.POST, "/api/v1/registerconsultant").permitAll()
        .antMatchers(HttpMethod.POST, "/api/v1/profiles/**").permitAll()
        .antMatchers(HttpMethod.PUT, "/api/v1/profiles/**").permitAll()
        .antMatchers(HttpMethod.POST, "/controllers/courses/**").hasRole("ADMIN")
        .antMatchers(HttpMethod.PUT,"/controllers/courses/**").hasRole("ADMIN")
        .antMatchers("/api/v1/admin/**").hasRole("ADMIN")

        .antMatchers("/api/v1/courses/**").authenticated()
        .antMatchers("/controllers/courses/me/**").authenticated()
        .regexMatchers("/controllers/courses/\\d+/reg").authenticated()
        .regexMatchers(HttpMethod.GET, ".*/api/v1/(users|inbox|appointments|notifications|profiles)(/|/\\d+)?.*").authenticated()
        
        .antMatchers(HttpMethod.POST, "/controllers/appointments/**").authenticated()
        .antMatchers(HttpMethod.POST, "/api/v1/**").authenticated()
        .antMatchers(HttpMethod.PUT, "/api/v1/**").authenticated()
        .antMatchers(HttpMethod.DELETE, "/api/v1/**").authenticated()

        .antMatchers(HttpMethod.GET, "/api/v1/psychtests/**").authenticated()
        .antMatchers(HttpMethod.GET, "/api/v1/psychtestresults/**").authenticated()
        ;
  }

}