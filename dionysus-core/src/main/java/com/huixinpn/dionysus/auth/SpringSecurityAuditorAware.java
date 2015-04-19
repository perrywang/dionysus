package com.huixinpn.dionysus.auth;

import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.huixinpn.dionysus.domain.user.User;

@Component
public class SpringSecurityAuditorAware implements AuditorAware<User> {

	@Override
	public User getCurrentAuditor() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		if (auth != null) {
			Object principal = auth.getPrincipal();
			if (principal instanceof User) {
				return (User) principal;
			}
		}
		return null;
	}
}