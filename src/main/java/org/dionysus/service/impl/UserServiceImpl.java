package org.dionysus.service.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.dionysus.model.User;
import org.dionysus.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional(readOnly=true)
	public User find(Long id) {
		return entityManager.find(User.class, id);
	}

	@Override
	@Transactional(readOnly=false)
	public User save(User user) {
		entityManager.persist(user);
		return user;
	}

	@Override
	@Transactional(readOnly=false)
	public void remove(User user) {
		entityManager.remove(user);
	}
}
