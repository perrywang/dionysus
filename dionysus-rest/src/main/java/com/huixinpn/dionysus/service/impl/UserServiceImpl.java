package com.huixinpn.dionysus.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.huixinpn.dionysus.domain.User;
import com.huixinpn.dionysus.repository.UserRepository;
import com.huixinpn.dionysus.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userRepository")
	private UserRepository repository;
	
	@Autowired
	private PasswordEncoder encoder;

	@Override
	public boolean userValidation(String name, String password) {
		if (name.isEmpty() || name == null)
			return false;
		if (password.isEmpty() || password == null)
			return false;
		User user_search_name = repository.findByUsername(name);
		if (user_search_name == null)
			return false;
		if (!user_search_name.isEnabled())
			return false;
		if (!user_search_name.isAccountNonExpired())
			return false;
		if (!user_search_name.isAccountNonLocked())
			return false;
		if (!user_search_name.isCredentialsNonExpired())
			return false;
		return encoder.matches(password,
				user_search_name.getEncryptedPassword());
	}

	@Override
	public User register(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User sign(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}
}
