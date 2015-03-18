package org.dionysus;

import org.dionysus.auth.DionysusUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("dionysus")
	private DionysusUserDetailsService securityUserService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.inMemoryAuthentication()
//		    .withUser("admin").password("admin").roles("ADMIN", "USER").and()
//			.withUser("user").password("password").roles("USER");
		auth.userDetailsService(securityUserService).passwordEncoder(passwordEncoder());


	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
//		http.antMatcher("/api/v1/**")
//			.authorizeRequests()
//				.anyRequest().hasRole("USER")
//				.and()
//			.httpBasic();

//		http.antMatcher("/api/v1/**")
//			.authorizeRequests()
//			.anyRequest()
//			.permitAll();
		
	    http.authorizeRequests()     
            .antMatchers("/api/v1/admin/**")
            .access("hasRole('ROLE_ADMIN')")
            .and()
            .formLogin()
            //login.js is the login web page
            .loginPage("/login").failureUrl("/login?error")
			.usernameParameter("username")
			.passwordParameter("password")
			.and().logout().logoutSuccessUrl("/login?logout")
			//403.js is the web page when access is denied
			.and().exceptionHandling().accessDeniedPage("/403");
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
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
}