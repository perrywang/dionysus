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
	public boolean userValidation(String name, String password)
			throws UsernameNotFoundException {
		if (name.isEmpty() || name == null)
			return false;
		if (password.isEmpty() || password == null)
			return false;
		User user = repository.findByUsername(name);
		if (user == null) {
			throw new UsernameNotFoundException("UserName " + name + " not found");
		}
		if (!user.isEnabled())
			return false;
		if (!user.isAccountNonExpired())
			return false;
		if (!user.isAccountNonLocked())
			return false;
		if (!user.isCredentialsNonExpired())
			return false;
		return encoder.matches(password, user.getEncryptedPassword());
	}

	@Override
	public User register(User user) {
		if (user == null)
			return null;
		if (user.getUsername().isEmpty() || user.getUsername() == null)
			return null;
		if (user.getPassword().isEmpty() || user.getPassword() == null)
			return null;

		repository.save(user);
		manager.detach(user);
		user.setPassword("");
		user.setEncryptedPassword("");
		return user;
	}

	@Override
	public User sign(String username, String password) 
			throws UsernameNotFoundException{
		if (username.isEmpty() || username == null)
			return null;
		if (password.isEmpty() || password == null)
			return null;
		User user = repository.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("UserName " + username + " not found");
		}
		if (!user.isEnabled())
			return null;
		if (!user.isAccountNonExpired())
			return null;
		if (!user.isAccountNonLocked())
			return null;
		if (!user.isCredentialsNonExpired())
			return null;
		if(!encoder.matches(password, user.getEncryptedPassword())){
			throw new UsernameNotFoundException("Password " + password + " not match");
		}
		manager.detach(user);
		user.setPassword("");
		user.setEncryptedPassword("");
		return user;
	}

	@Override
	public UserDetails loadUserByUsername(String username) {
		User user = repository.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("UserName " + username + " not found");
		}
		manager.detach(user);
		user.setPassword("");
		user.setEncryptedPassword("");
		return user;
	}
}
