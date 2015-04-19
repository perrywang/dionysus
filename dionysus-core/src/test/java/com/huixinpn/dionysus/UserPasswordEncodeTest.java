package com.huixinpn.dionysus;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.huixinpn.dionysus.domain.user.User;

public class UserPasswordEncodeTest extends AbstractPersistentTest {

	private static final String USER_NAME = "encrypt-password";

	
	@Autowired
	private PasswordEncoder encoder;

	@Test
	public void testUserPasswordEncrypt() {
		User user = userRepository.findByUsername(USER_NAME);
		if (user == null) {
			user = new User(USER_NAME, "password");
			Assert.assertNull(user.getEncryptedPassword());
			userRepository.save(user);
			Assert.assertNotNull(user.getEncryptedPassword());
			Assert.assertNotEquals("password", user.getEncryptedPassword());
			encoder.matches("password", user.getEncryptedPassword());
		}
	}
}
