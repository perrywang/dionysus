package com.huixinpn.dionysus.domain;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;

@Entity
@Table(name = "courses")
@EntityListeners(AuditingEntityListener.class)
public class Course extends AbstractDionysusNotifiable<User> {

  private static final long serialVersionUID = 2523934617928638918L;

  @NotBlank
  @Column(name = "title")
  private String title;

  @Lob
  @Column(name = "description")
  private String description;

  @Column(name = "state")
  @Enumerated(EnumType.STRING)
  private CourseState state;

  @Column(name = "approach")
  @Enumerated(EnumType.STRING)
  private CourseApproach approach;

  @Column(name = "calendar")
  @Temporal(TemporalType.DATE)
  private Calendar date;

  @ManyToOne
  private Consultant consultant;

  @ManyToMany
  private Collection<User> users;

  public Course() {
    this.state = CourseState.OPEN;
    this.users = new ArrayList<User>();
  }

  public Course(String title, String description) {
    this();
    this.setTitle(title);
    this.setDescription(description);
  }

  public Course(String title, String description, Calendar date) {
    this();
    this.setTitle(title);
    this.setDescription(description);
    this.setDate(date);
  }

  @Override
  public Collection<User> sendTo() {
    if (this.state == CourseState.IN_PROGRESS) {
      return this.getUsers();
    } else {
      return new ArrayList<User>();
    }
  }

  @Override
  public String getSummary() {
    return this.getTitle();
  }

  public CourseApproach getApproach() {
    return approach;
  }

  public void setApproach(CourseApproach approach) {
    this.approach = approach;
  }

  public Calendar getDate() {
    return date;
  }

  public void setDate(Calendar date) {
    this.date = date;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public CourseState getState() {
    return state;
  }

  public void setState(CourseState state) {
    this.state = state;
  }

  public Collection<User> getUsers() {
    return users;
  }

  public void setUsers(Collection<User> users) {
    this.users = users;
  }

  public Consultant getConsultant() {
    return consultant;
  }

  public void setConsultant(Consultant consultant) {
    this.consultant = consultant;
  }

  @Override
  public String toString() {
    return this.getTitle() + " (" + this.getState() + ")";
  }
}
