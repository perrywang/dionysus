package com.huixinpn.dionysus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;

import com.huixinpn.dionysus.domain.User;
import com.huixinpn.dionysus.repository.UserRepository;

@Controller
public class LoginController implements UserService {

	@Autowired
	@Qualifier("userRepository") UserRepository repository;
	
	@Override
	public boolean UserValidation(String name, String password) {
		// TODO Auto-generated method stub
		if(name.isEmpty() || name == null)
			return false;
		if(password.isEmpty() || password == null)
			return false;
		User user_search_name = repository.findByUsername(name);
		if(user_search_name == null)
			return false;
		if(!user_search_name.isEnabled())
			return false;
		if(!user_search_name.isAccountNonExpired())
			return false;
		if(!user_search_name.isAccountNonLocked())
			return false;
		if(!user_search_name.isCredentialsNonExpired())
			return false;
		//System.out.print(passwordEncoder().encode(password));
		return passwordEncoder().matches(password, user_search_name.getEncryptedPassword());
	}
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
}
