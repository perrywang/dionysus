package com.huixinpn.dionysus;

import com.huixinpn.dionysus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

  @Autowired
  private UserService securityUserService;

  @Autowired
  private PasswordEncoder encoder;

  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(securityUserService).passwordEncoder(encoder);
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    //todo hardcode, detailed design
    http.csrf().disable()
        .authorizeRequests();
/*        .antMatchers("/api/v1/admin*//**").hasRole("ADMIN")
        .regexMatchers(HttpMethod.GET, "api/v1/users|inbox|appointments|consultants|notifications|profiles").hasAnyRole("USER", "ADMIN")
        .regexMatchers(HttpMethod.POST, "api/v1/users|inbox|appointments|consultants|notifications|profiles").hasAnyRole("USER", "ADMIN")
        .regexMatchers(HttpMethod.PUT, "api/v1/users|inbox|appointments|consultants|notifications|profiles").hasAnyRole("USER", "ADMIN")
        .regexMatchers(HttpMethod.DELETE, "api/v1/users|inbox|appointments|consultants|notifications|profiles").hasAnyRole("USER", "ADMIN")
        .antMatchers(HttpMethod.POST, "/api/v1*//**").hasRole("ADMIN")
        .antMatchers(HttpMethod.PUT, "/api/v1*//**").hasRole("ADMIN")
        .antMatchers(HttpMethod.DELETE, "/api/v1*//**").hasRole("ADMIN");*/
  }


  @Override
  public void configure(WebSecurity web) throws Exception {
    web.ignoring()
        .antMatchers(HttpMethod.POST, "/api/v1/login")
        .antMatchers(HttpMethod.GET, "/",
            "/themes/**", "/public/**",
            "/styles/**", "/fonts/**", "/images/**", "/scripts/**");
  }
}