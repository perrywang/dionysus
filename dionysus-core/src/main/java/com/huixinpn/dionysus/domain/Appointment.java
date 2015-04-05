package com.huixinpn.dionysus.domain;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.Calendar;

/**
 * Created by huanghao on 4/4/15.
 * Used to represent the one-one appointment
 */


@Entity
@Table(name="appointments")
public class Appointment extends AbstractDionysusAuditable<User> {

    private static final long serialVersionUID = 4106091118545531113L;

    @NotBlank
    @ManyToOne(fetch = FetchType.EAGER)
    private User user;

    @NotBlank
    @ManyToOne(fetch = FetchType.EAGER)
    private User consultant;

    @Column(name = "state")
    @Enumerated(EnumType.STRING)
    private AppointmentStatus state;

    @Column(name = "approach")
    @Enumerated(EnumType.STRING)
    private AppointmentApproach approach;

    @Column(name = "calendar")
    @Temporal(TemporalType.DATE)
    private Calendar date;

    @Lob @Column(name = "reason")
    private String reason;


    public Appointment(){}

    public Appointment(User user, User consultant, AppointmentApproach approach){
        this.user = user;
        this.consultant = consultant;
        this.approach = approach;
        this.state = AppointmentStatus.WAITING;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getConsultant() {
        return consultant;
    }

    public void setConsultant(User consultant) {
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
}
