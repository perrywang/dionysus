package com.huixinpn.dionysus.domain.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import java.util.Collection;

@Entity
@Table(name = "roles")
public class Role extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -4397869977138590249L;

  @NotNull
  @Column(name = "name")
  private String name;

  @ManyToMany(mappedBy = "roles")
  @JsonIgnore
  private Collection<User> users;

  public Role() {
  }

  public Role(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Collection<User> getUsers() {
    return users;
  }

  public void setUsers(Collection<User> users) {
    this.users = users;
  }

  @Override
  public String toString() {
    return "Role: " + this.name;
  }
} 

