package com.huixinpn.dionysus.domain.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huixinpn.dionysus.auth.PasswordListener;
import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.domain.course.Course;
import lombok.Data;
import org.springframework.data.rest.core.annotation.RestResource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
@EntityListeners(PasswordListener.class)
public class User extends AbstractDionysusAuditable<User> implements UserDetails {

  private static final long serialVersionUID = 6574790333326442416L;

  @NotNull
  @Size(min = 4, max = 40)
  @Column(name = "username", unique = true)
  private String username;

  @Transient
  transient private String password;

  @Transient
  transient private Long notificationCount;

  @JsonIgnore
  @Column(name = "password")
  private String encryptedPassword;

  @Column(name = "email")
  private String email;

  @Column(name = "gender")
  private String gender;

  @Column(name = "age")
  private String age;

  @Column(name = "education")
  private String education;

  @Column(name = "married")
  private String married;

  @Lob
  @Column(name = "address")
  private String address;

  @Column(name = "mobile")
  private String mobile;

  @Column(name = "landline")
  private String landline;

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

  @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @RestResource(exported = false)
  private Set<Role> roles;

  @ManyToMany(cascade = CascadeType.ALL, mappedBy = "users")
  private Collection<Course> courses = new ArrayList<>();

  @OneToOne(cascade = {CascadeType.ALL})
  private Profile profile;

  @OneToOne(cascade = {CascadeType.ALL})
  private Inbox inbox;

  @Lob
  @Column(name = "about")
  private String about;

  @Lob
  @Column(name = "avatar")
  private String avatar;

  @Column(name = "qq")
  private String qq;

  @Column(name = "qq_address")
  private String qqAddress;

  @Column(name = "realname")
  private String realName;

  @Enumerated(EnumType.STRING)
  private OrganizationStatus organizationStatus = OrganizationStatus.NONE;

  private String contact;

  public String getQq() {
    return qq;
  }

  public void setQq(String qq) {
    this.qq = qq;
  }

  public String getQqAddress() {
    return qqAddress;
  }

  public void setQqAddress(String qqAddress) {
    this.qqAddress = qqAddress;
  }

  public String getAvatar() {
    return avatar;
  }

  public void setAvatar(String avatar) {
    this.avatar = avatar;
  }

  public String getAbout() {
    return about;
  }

  public void setAbout(String about) {
    this.about = about;
  }

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

  public User(Long id) {
    super(id);
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

  public Collection<Course> getCourses() {
    return courses;
  }

  public void setCourses(Collection<Course> courses) {
    this.courses = courses;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    Collection<GrantedAuthority> authorities = new ArrayList<>();
    Set<Role> userRoles = this.getRoles();

    if (userRoles != null) {
      for (Role role : userRoles) {
    	if(role.getName().endsWith("ROLE_CONSULTANT")) return null;
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getName());
        authorities.add(authority);
      }
    }
    return authorities;
  }

  public void setUsername(String username) {
    this.username = username;
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

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getAge() {
    return age;
  }

  public void setAge(String age) {
    this.age = age;
  }

  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }

  public String getMarried() {
    return married;
  }

  public void setMarried(String married) {
    this.married = married;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getMobile() {
    return mobile;
  }

  public void setMobile(String mobile) {
    this.mobile = mobile;
  }

  public String getLandline() {
    return landline;
  }

  public void setLandline(String landline) {
    this.landline = landline;
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
    //satisfy UsernamepasswordAuthentionToken requirement.
    return this.username;
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
