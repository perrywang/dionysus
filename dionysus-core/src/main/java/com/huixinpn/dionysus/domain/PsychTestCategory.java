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
  private PsychTestCategory parent;

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

  public PsychTestCategory getParent() {
    return parent;
  }

  public void setParent(PsychTestCategory parent) {
    this.parent = parent;
  }
}
