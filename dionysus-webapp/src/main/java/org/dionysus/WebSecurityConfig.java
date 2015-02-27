package org.dionysus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebMvcSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("dionysus")
	private UserDetailsService securityUserService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
//	    http.csrf().disable()
//	    	.antMatcher("/api/v1/*")
//	    		.authorizeRequests()
//	    		.antMatchers("/*").hasAnyRole("USER", "ADMIN")
//	    		.anyRequest()
//	    		.authenticated();
	    http.csrf().disable()
	    	.antMatcher("/api/v1")
	    	.authorizeRequests()
	    	.antMatchers("/*")
	    	.anonymous();
//	    .and()
//	    	.formLogin()
//	    	.permitAll()
//	    .and()
//	    	.logout()
//            .permitAll();
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/");
	}

	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
		    .withUser("admin")
		    .password("admin")
		    .roles("ADMIN", "USER")
		.and()
			.withUser("user")
			.password("password")
			.roles("USER");
//		auth.userDetailsService(securityUserService);
	}
}