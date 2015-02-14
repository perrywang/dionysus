package org.dionysus.service.impl;

import org.dionysus.domain.SecurityUser;
import org.dionysus.domain.User;
import org.dionysus.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("dionysus")
public class SecurityUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userService.findByName(username);
		if (user == null) {
			throw new UsernameNotFoundException("UserName " + username + " not found");
		}
		return new SecurityUser(user);
	}

}
