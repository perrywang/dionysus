package com.huixinpn.dionysus.domain;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import java.util.Collection;

@Entity
@Table(name = "consultants")
@PrimaryKeyJoinColumn
public class Consultant extends User {

  @OneToMany(mappedBy = "consultant")
  private Collection<Course> teachings;

  @OneToMany(mappedBy = "consultant")
  private Collection<Appointment> appointments;

  public Consultant() {
    super();
  }

  public Collection<Course> getTeachings() {
    return teachings;
  }

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
