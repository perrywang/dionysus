package com.huixinpn.dionysus.service.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.huixinpn.dionysus.domain.User;
import com.huixinpn.dionysus.exception.InvalidUserException;
import com.huixinpn.dionysus.repository.UserRepository;
import com.huixinpn.dionysus.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userRepository")
	private UserRepository repository;

	@Autowired
	private PasswordEncoder encoder;

	@PersistenceContext
	private EntityManager manager;

	@Override
	public User register(User user) {
		// there is bean validation in domain type
		// no need to check property here
		repository.save(user);
		manager.detach(user);
		user.setPassword("");
		user.setEncryptedPassword("");
		return user;
	}

	@Override
	public User sign(String username, String password) {
		User user = repository.findByUsername(username);
		if(user == null || !encoder.matches(password, user.getEncryptedPassword())){
			throw new InvalidUserException("invalid user: " + username);
		}
		// TODO: should attache security token here
		manager.detach(user);
		user.setPassword("");
		user.setEncryptedPassword("");
		return user;
	}

	@Override
	public UserDetails loadUserByUsername(String username) {
		User user = repository.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("user not found: " + username);
		}
		manager.detach(user);
		user.setPassword("");
		user.setEncryptedPassword("");
		return user;
	}
}
