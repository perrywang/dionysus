package org.dionysus.auth;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.dionysus.domain.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordListener {

	// XXX: Spring cannot inject bean into JPA EntityListener
	private PasswordEncoder encoder = new BCryptPasswordEncoder();

	@PrePersist
	@PreUpdate
	void encryptPassword(User user) {
		String password = user.getPassword();
		if (password != null) {
			String passwordHash = encoder.encode(password);
			user.setEncryptedPassword(passwordHash);
		}
	}
}
