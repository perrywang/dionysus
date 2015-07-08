package com.huixinpn.dionysus.service;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.huixinpn.dionysus.domain.user.User;
import org.springframework.ui.Model;

import java.util.HashMap;

@RepositoryRestResource(collectionResourceRel = "users", path = "users")
public interface UserService extends UserDetailsService {

	public User register(User user);

	public User sign(String username, String password);
	
	public boolean sendemailtouser(User user);
	
	public User updateprofile(User user);

    public void changePassword(String oldPass, String newPass, HashMap revalue);
}
