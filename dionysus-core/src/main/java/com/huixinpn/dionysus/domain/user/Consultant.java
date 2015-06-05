package com.huixinpn.dionysus.domain.user;

import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.domain.course.Course;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name = "consultants")
@PrimaryKeyJoinColumn
public class Consultant extends User {

  private static final long serialVersionUID = 6574790333326445416L;

  @OneToMany(mappedBy = "consultant")
  private Collection<Course> teachings;

  @OneToMany(mappedBy = "consultant")
  private Collection<Appointment> appointments = new ArrayList<>();

  public Consultant() {
    super();
  }

  public Consultant(String name, String pass) {
    super(name, pass);
  }

  public Collection<Course> getTeachings() {
    return teachings;
  }

  public Consultant(Long id) {
    super(id);
  }

  @ElementCollection(targetClass=ConsExpertise.class)
  @CollectionTable(name="consultant_expertise")
  @Enumerated(EnumType.STRING)
  @Column(name="expertise")
  private Collection<ConsExpertise> expertises = new ArrayList<>();

  public void setTeachings(Collection<Course> teachings) {
    this.teachings = teachings;
  }

  public Collection<Appointment> getAppointments() {
    return appointments;
  }

  public void setAppointments(Collection<Appointment> appointments) {
    this.appointments = appointments;
  }
}
