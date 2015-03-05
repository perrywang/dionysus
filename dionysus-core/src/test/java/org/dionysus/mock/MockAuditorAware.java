package org.dionysus.mock;

import org.dionysus.domain.User;
import org.springframework.data.domain.AuditorAware;
import org.springframework.stereotype.Component;

@Component
public class MockAuditorAware implements AuditorAware<User> {

	private User currentAuditor;

	@Override
	public User getCurrentAuditor() {
		return currentAuditor;
	}

	public void setCurrentAuditor(User user) {
		this.currentAuditor = user;
	}
}