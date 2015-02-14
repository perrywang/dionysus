package org.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import org.dionysus.domain.Role;
import org.dionysus.domain.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUser extends User implements UserDetails {

	private static final long serialVersionUID = -8726922496312801092L;

	public SecurityUser(User user) {
		this.setId(user.getId());
		this.setName(user.getName());
		this.setEmail(user.getEmail());
		this.setPassword(user.getPassword());
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		Set<Role> userRoles = this.getRoles();
		if (userRoles != null) {
			for (Role role : userRoles) {
				SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getName());
				authorities.add(authority);
			}
		}
		return authorities;
	}

	@Override
	public String getUsername() {
		return super.getName();
	}

	@Override
	public boolean isAccountNonExpired() {
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return false;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
