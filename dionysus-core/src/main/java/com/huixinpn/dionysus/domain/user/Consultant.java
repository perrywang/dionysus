package com.huixinpn.dionysus.domain.user;

import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.domain.course.Course;
import lombok.Data;
import lombok.NoArgsConstructor;

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

@Data
@NoArgsConstructor
@Entity
@Table(name = "consultants")
@PrimaryKeyJoinColumn
public class Consultant extends User {

  private static final long serialVersionUID = 6574790333326445416L;

  @OneToMany(mappedBy = "consultant")
  private Collection<Course> teachings;

  @OneToMany(mappedBy = "consultant")
  private Collection<Appointment> appointments = new ArrayList<>();


  public Consultant(String name, String pass) {
    super(name, pass);
  }

  public Collection<Course> getTeachings() {
    return teachings;
  }

  public Consultant(Long id) {
    super(id);
  }

  @ManyToMany
  private Collection<ConsExpertise> expertises = new ArrayList<>();

}
