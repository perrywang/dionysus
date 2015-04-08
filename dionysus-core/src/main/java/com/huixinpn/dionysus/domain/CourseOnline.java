package com.huixinpn.dionysus.domain;

import javax.persistence.*;

@Entity
@Table(name = "courseonline")
@PrimaryKeyJoinColumn
public class CourseOnline extends Course {

  private static final long serialVersionUID = 2523934617928638928L;

  @Enumerated(EnumType.STRING)
  private CourseApproach approach;

  public CourseOnline() {
    super();
  }

  public CourseApproach getApproach() {
    return approach;
  }

  public void setApproach(CourseApproach approach) {
    this.approach = approach;
  }
}
