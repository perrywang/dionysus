package com.huixinpn.dionysus;

import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.repository.UserRepository;

@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("test")
@SpringApplicationConfiguration(classes = DomainApplicationContext.class)
public abstract class AbstractPersistentTest {

	protected static final String DEFAULT_USERNAME = "testUser";

	@PersistenceContext
	protected EntityManager entityManager;

	@Autowired
	protected UserRepository userRepository;

	protected User createUser(String username) {
		User user = userRepository.findByUsername(username);
		if (user == null) {
			user = new User(username, "password");
			userRepository.save(user);
			entityManager.flush();
		}
		return user;
	}

	protected void runAs(String username) {
		User user = createUser(username);
		String password = UUID.randomUUID().toString();
		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication(new UsernamePasswordAuthenticationToken(user,
				password));
	}

	@Before
	public void wireUpAuditor() {
		runAs(DEFAULT_USERNAME);
	}
}
