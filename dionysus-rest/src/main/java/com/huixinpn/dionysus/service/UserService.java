package com.huixinpn.dionysus.service;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.User;

@RepositoryRestResource(collectionResourceRel = "users", path = "users")
public interface UserService {
	public boolean userValidation(String name, String password);

	public User register(User user);
}
