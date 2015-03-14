package org.dionysus.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
public class User extends AbstractPersistable<Long> implements UserDetails {

	private static final long serialVersionUID = 6574790333326442416L;

	@NotNull
	@Size(min = 4, max = 40)
	@Column(name = "username", unique = true)
	private String username;

	@NotNull
//	@Size(min = 60, max = 60)
	@Column(name = "password")
	private String password;
	private String email;

	@NotNull
	@Column(name = "account_non_expired")
	private boolean accountNonExpired;
	
	@NotNull
	@Column(name = "account_non_locked")
	private boolean accountNonLocked;

	@NotNull
	@Column(name = "credentials_non_expired")
	private boolean credentialsNonExpired;

	@NotNull
	@Column(name = "enabled")
	private boolean enabled;

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "authorities")
	@Enumerated(EnumType.STRING)
	private Set<Role> authorities;

	@OneToOne(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private Profile profile;
	
	@OneToOne(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private Inbox inbox;

	public User() {
		this.accountNonExpired = true;
		this.accountNonLocked = true;
		this.credentialsNonExpired = true;
		this.enabled = true;

		this.authorities = new HashSet<Role>();
		this.inbox = new Inbox(this);
		this.profile = new Profile(this);
	}

	public User(String username, String password, String email) {
		this();
		this.username = username;
		this.password = password;
		this.email = email;
	}

	@Override
	public String getUsername() {
		return username;
	}
	
	@Override
	public Set<Role> getAuthorities() {
		return authorities;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setAuthorities(Set<Role> authorities) {
		this.authorities = authorities;
	}

	public boolean grantAuthority(Role authority) {
		return authorities.add(authority);
	}

	public boolean revokeAuthority(Role authority) {
		return authorities.remove(authority);
	}

	@Override
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
}
