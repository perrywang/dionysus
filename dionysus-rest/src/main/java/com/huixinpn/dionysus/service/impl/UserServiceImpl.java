package com.huixinpn.dionysus.service.impl;

import java.util.List;

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
		User user_search_name = repository.findByUsername(name);
		if (user_search_name == null) {
			throw new UsernameNotFoundException("UserName " + name
					+ " not found");
		}
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
		if (user == null)
			return null;
		if (user.getUsername().isEmpty() || user.getUsername() == null)
			return null;
		if (user.getPassword().isEmpty() || user.getPassword() == null)
			return null;
		List<User> userlist = repository.findAll();
		for (User _user : userlist) {
			if (_user.equals(user))
				return null;
		}
		repository.save(user);
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		User domain_user = new User(user.getUsername(), user.getPassword());
		domain_user.setAccountNonExpired(accountNonExpired);
		domain_user.setAccountNonLocked(accountNonLocked);
		domain_user.setCredentialsNonExpired(credentialsNonExpired);
		domain_user.setEnabled(enabled);
		domain_user.setAuthorities(user.getAuthorities());
		return domain_user;
	}

	@Override
	public User sign(String username, String password) {
		if (!userValidation(username, password))
			throw new UsernameNotFoundException("UserName " + username + " not found");
		User user = repository.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("UserName " + username + " not found");
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

		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		User domain_user = new User(user.getUsername(),
				user.getPassword());
		domain_user.setAccountNonExpired(accountNonExpired);
		domain_user.setAccountNonLocked(accountNonLocked);
		domain_user.setCredentialsNonExpired(credentialsNonExpired);
		domain_user.setEnabled(enabled);
		domain_user.setAuthorities(user.getAuthorities());
		return domain_user;
	}

}
