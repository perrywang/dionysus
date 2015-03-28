package com.huixinpn.dionysus.service;

import com.huixinpn.dionysus.domain.User;

public interface UserService {

	public boolean userValidation(String name, String password);

	public User register(User user);

	public User sign(String username, String password);
}
