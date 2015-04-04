package com.huixinpn.dionysus.service.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huixinpn.dionysus.domain.User;
import com.huixinpn.dionysus.repository.UserRepository;
import com.huixinpn.dionysus.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userRepository")
	private UserRepository repository;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@PersistenceContext
	protected EntityManager entityManager;

	@Override
	public boolean userValidation(String name, String password) 
			throws UsernameNotFoundException{
		if (name.isEmpty() || name == null)
			return false;
		if (password.isEmpty() || password == null)
			return false;
		User user_search_name = repository.findByUsername(name);
		if(user_search_name == null){
			throw new UsernameNotFoundException("UserName "+name+" not found");
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
		try{
			if (user == null) 
				return null;
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
		catch(Exception e){
			return null;
		}		
	}

	@Override
	public User sign(String username, String password) 
			throws UsernameNotFoundException{
		if(!userValidation(username, password))
			return null;
		User user_search_name = repository.findByUsername(username);
		if(user_search_name == null){
			throw new UsernameNotFoundException("UserName "+username+" not found");
		}
		entityManager.detach(user_search_name);
		user_search_name.setPassword(null);
		user_search_name.setEmail(null);
		user_search_name.setEncryptedPassword(null);
		user_search_name.setInbox(null);
		user_search_name.setProfile(null);
		user_search_name.setAuthorities(null);
		user_search_name.setAccountNonExpired(false);
		user_search_name.setAccountNonLocked(false);
		user_search_name.setCredentialsNonExpired(false);
		user_search_name.setEnabled(false);
		return user_search_name;
	}

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		try {
			User temp_user = repository.findByUsername(username);
			if(temp_user == null){
				throw new UsernameNotFoundException("UserName "+username+" not found");
			}
			boolean enabled = true;
			boolean accountNonExpired = true;
			boolean credentialsNonExpired = true;
			boolean accountNonLocked = true;
			User domain_user = new User(temp_user.getUsername(), temp_user.getPassword());
			domain_user.setAccountNonExpired(accountNonExpired);
			domain_user.setAccountNonLocked(accountNonLocked);
			domain_user.setCredentialsNonExpired(credentialsNonExpired);
			domain_user.setEnabled(enabled);
			domain_user.setAuthorities(temp_user.getAuthorities());
			return domain_user;
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}

}
