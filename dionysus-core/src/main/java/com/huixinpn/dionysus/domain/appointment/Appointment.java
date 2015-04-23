package com.huixinpn.dionysus.domain.appointment;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.AbstractDionysusNotifiable;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by huanghao on 4/4/15.
 * Used to represent the one-one appointment
 */


@Entity
@Table(name = "appointments")
public class Appointment extends AbstractDionysusNotifiable<User> {

  private static final long serialVersionUID = 4106091118545531113L;

  @NotNull
  @ManyToOne(fetch = FetchType.EAGER)
  private User user;

  @NotNull
  @ManyToOne(fetch = FetchType.EAGER)
  private Consultant consultant;

  @Column(name = "state")
  @Enumerated(EnumType.STRING)
  private AppointmentStatus state;

  @Column(name = "approach")
  @Enumerated(EnumType.STRING)
  private AppointmentApproach approach;

  @Column(name = "calendar")
  @Temporal(TemporalType.DATE)
  private Calendar date;

  @Lob
  @Column(name = "reason")
  private String reason;

  public Appointment() {
      this.state = AppointmentStatus.WAITING;
  }

  public Appointment(User user, Consultant consultant, AppointmentApproach approach, Calendar date, String reason) {
    this.user = user;
    this.consultant = consultant;
    this.approach = approach;
    this.state = AppointmentStatus.WAITING;
    this.date = date;
    this.reason = reason;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Consultant getConsultant() {
    return consultant;
  }

  public void setConsultant(Consultant consultant) {
    this.consultant = consultant;
  }

  public AppointmentStatus getState() {
    return state;
  }

  public void setState(AppointmentStatus state) {
    this.state = state;
  }

  public AppointmentApproach getApproach() {
    return approach;
  }

  public void setApproach(AppointmentApproach approach) {
    this.approach = approach;
  }

  public Calendar getDate() {
    return date;
  }

  public void setDate(Calendar date) {
    this.date = date;
  }

  public String getReason() {
    return reason;
  }

  public void setReason(String reason) {
    this.reason = reason;
  }

  @Override
  public String toString() {
    return "Appointment{" +
        "user=" + user +
        ", consultant=" + consultant +
        ", state=" + state +
        ", approach=" + approach +
        ", date=" + date +
        ", reason='" + reason + '\'' +
        '}';
  }

  @Override
  public String getSummary(){
        return this.getReason();
  }


    @Override
    public List<User> sendTo(){
        User user = this.getUser();
        User consultant = this.getConsultant();
        List<User> users = new ArrayList<User>();

        if(consultant!=null){
            users.add(consultant);
        }

        if(user!=null){
            users.add(user);
        }

        return users;

    }
}
