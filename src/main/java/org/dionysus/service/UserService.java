package org.dionysus.service;

import org.dionysus.model.User;

public interface UserService {

	User find(Long id);
	
	User save(User user);
	
	void remove(User user);
}
