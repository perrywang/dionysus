package org.dionysus.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.dionysus.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class UserRepositoryImpl implements UserSignUpRepository {
	
	@PersistenceContext
	private EntityManager em;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void signUp(User user) {
		String passwordHash = passwordEncoder.encode(user.getPassword());
		user.setPassword(passwordHash);

		em.persist(user);
	}

}