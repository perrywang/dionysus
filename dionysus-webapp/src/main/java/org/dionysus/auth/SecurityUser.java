package org.dionysus.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import org.dionysus.domain.Role;
import org.dionysus.domain.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUser implements UserDetails {

	private static final long serialVersionUID = -8726922496312801092L;

	private User user;
	
	public SecurityUser(User user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		Set<Role> userRoles = user.getRoles();
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
		return user.getName();
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public User getUser() {
        return user;
    }
}
