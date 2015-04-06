package com.huixinpn.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.rest.core.annotation.RestResource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.huixinpn.dionysus.auth.PasswordListener;

@Entity
@Table(name = "users")
@EntityListeners(PasswordListener.class)
public class User extends AbstractDionysusPersistable implements UserDetails {

	private static final long serialVersionUID = 6574790333326442416L;

	@NotNull
	@Size(min = 4, max = 40)
	@Column(name = "username", unique = true)
	private String username;

	@Transient
	transient private String password;

	@RestResource(exported = false)
	@Column(name = "password")
	private String encryptedPassword;

	@Column(name = "email")
	private String email;

	@NotNull
	@RestResource(exported = false)
	@Column(name = "account_non_expired")
	private boolean accountNonExpired;

	@NotNull
	@RestResource(exported = false)
	@Column(name = "account_non_locked")
	private boolean accountNonLocked;

	@NotNull
	@RestResource(exported = false)
	@Column(name = "credentials_non_expired")
	private boolean credentialsNonExpired;

	@NotNull
	@RestResource(exported = false)
	@Column(name = "enabled")
	private boolean enabled;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "user_username")
	@RestResource(exported = false)
	private Set<Role> roles;

	@OneToOne(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@RestResource(exported = false)
	private Profile profile;

	@OneToOne(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@RestResource(exported = false)
	private Inbox inbox;

	public User() {
		this.accountNonExpired = true;
		this.accountNonLocked = true;
		this.credentialsNonExpired = true;
		this.enabled = true;

		this.roles = new HashSet<Role>();
		this.inbox = new Inbox(this);
		this.profile = new Profile(this);
	}

	public User(String username, String password) {
		this();
		this.username = username;
		this.password = password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<>();
		Set<Role> userRoles = this.getRoles();

		if (userRoles != null) {
			for (Role role : userRoles) {
				SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
				authorities.add(authority);
			}
		}
		return authorities;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setAuthorities(Set<Role> roles) {
		this.roles = roles;
	}

	public boolean grantAuthority(Role role) {
		return roles.add(role);
	}

	public boolean revokeAuthority(Role role) {
		return roles.remove(role);
	}

	@Override
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEncryptedPassword() {
		return encryptedPassword;
	}

	public void setEncryptedPassword(String encryptedPassword) {
		this.encryptedPassword = encryptedPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public Inbox getInbox() {
		return inbox;
	}

	public void setInbox(Inbox inbox) {
		this.inbox = inbox;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("User: \n");
		sb.append("  id: " + this.getId() + "\n");
		sb.append("  username: " + this.getUsername() + "\n");
		sb.append("  profile: " + this.getProfile().getId() + "\n");
		sb.append("  inbox: " + this.getInbox().getId() + "\n");
		return sb.toString();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof User) {
			User other = (User) obj;
			Long id = this.getId();
			return (id != null) && id.equals(other.getId());
		}
		return false;
	}
}
