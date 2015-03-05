package org.dionysus.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Cacheable;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "users", uniqueConstraints = @UniqueConstraint(columnNames = "username", name = "uk_users_username"))
@Inheritance(strategy = InheritanceType.JOINED)
@Access(AccessType.PROPERTY)
@Cacheable
public class User extends AbstractPersistable<Integer> implements UserDetails {

	private static final long serialVersionUID = 6574790333326442416L;

	private String username;
	private String password;
	private String email;

	private boolean accountNonExpired;
	private boolean accountNonLocked;
	private boolean credentialsNonExpired;
	private boolean enabled;

	private Set<Role> authorities;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn
	private Profile profile;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn
	private Inbox inbox;
	//
	// @ManyToMany
	// @JoinTable
	// private Collection<Course> registeredCourses;

	public User() {
	}

	public User(String username, String password, String email) {
		this.username = username;
		this.password = password;
		this.email = email;

		this.accountNonExpired = true;
		this.accountNonLocked = true;
		this.credentialsNonExpired = true;
		this.enabled = true;

		this.authorities = new HashSet<Role>();
	}

	@NotNull
	@Size(min = 4, max = 40)
	@Column(name = "username")
	@Override
	public String getUsername() {
		return username;
	}

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "authorities")
	@Enumerated(EnumType.STRING)
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

	@NotNull
//	@Size(min = 60, max = 60)
	@Column(name = "password")
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

	@NotNull
	@Column(name = "account_non_expired")
	@Override
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	@NotNull
	@Column(name = "account_non_locked")
	@Override
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	@NotNull
	@Column(name = "credentials_non_expired")
	@Override
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	@NotNull
	@Column(name = "enabled")
	@Override
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

}
