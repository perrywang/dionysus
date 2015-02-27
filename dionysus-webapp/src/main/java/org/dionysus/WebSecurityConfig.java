package org.dionysus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("dionysus")
	private UserDetailsService securityUserService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
		    .withUser("admin").password("admin").roles("ADMIN", "USER").and()
			.withUser("user").password("password").roles("USER");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.antMatcher("/api/v1/**")
			.authorizeRequests()
				.anyRequest().hasRole("USER")
				.and()
			.httpBasic();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring()
			.antMatchers("/")
			.antMatchers("/font/**")
			.antMatchers("/styles/**")
			.antMatchers("/images/**")
			.antMatchers("/scripts/**");
	}
}