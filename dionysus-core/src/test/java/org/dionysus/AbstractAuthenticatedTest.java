package org.dionysus;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.dionysus.domain.Inbox;
import org.dionysus.domain.Profile;
import org.dionysus.domain.User;
import org.dionysus.repository.UserRepository;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

public abstract class AbstractAuthenticatedTest {
	
	protected static final String DEFAULT_USERNAME = "testUser";

	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	protected UserRepository userRepository;
	
	protected User createUser(String username) {
		User user = userRepository.findByUsername(username);
		if (user == null) {
			user = new User(username, "password", username + "@dionysus.org");
			user.setInbox(new Inbox(user));
			user.setProfile(new Profile(user));
			userRepository.save(user);
			entityManager.flush();
		}
		return user;
	}

	@Before
	public void wireUpAuditor() {
		User user = createUser(DEFAULT_USERNAME);
		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication(new UsernamePasswordAuthenticationToken(user, "password"));
	}
}
