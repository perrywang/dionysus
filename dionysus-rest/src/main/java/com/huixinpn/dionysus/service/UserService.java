package com.huixinpn.dionysus.service;

import java.util.List;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.huixinpn.dionysus.domain.User;

@RepositoryRestResource(collectionResourceRel = "users", path = "users")
public interface UserService extends UserDetailsService {

	public User register(User user);

	public User sign(String username, String password);

	public List<User> loaduserbyrole(String rolename);
}
