package com.huixinpn.dionysus.domain;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "psychtestcategories")
public class PsychTestCategory extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -4860066336043876229L;

  @NotEmpty
  @Column(name = "name", unique = true)
  private String name;

  @ManyToOne
  private Category parent;

  @OneToMany(mappedBy = "category")
  private Collection<PsychTest> tests;

  public PsychTestCategory() {
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Category getParent() {
    return parent;
  }

  public void setParent(Category parent) {
    this.parent = parent;
  }
}
