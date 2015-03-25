package com.huixinpn.dionysus.service;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "users", path = "users")
public interface UserService{
	public boolean UserValidation(String name, String password);
}
