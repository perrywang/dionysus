package com.huixinpn.dionysus.domain.appointment;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.AbstractDionysusNotifiable;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by huanghao on 4/4/15.
 * Used to represent the one-one appointment
 */

@Data
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
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm")
    private Calendar date;

    @Lob
    @Column(name = "reason")
    private String reason;

    private String name;

    private Integer age;

    private String phone;
    private String email;
    private String gender;

    @Lob
    @Column(name = "feedback")
    private String feedBack;

    public Appointment() {
        this.state = AppointmentStatus.WAITING;
    }

    public Appointment(User user, Consultant consultant, AppointmentApproach approach, Calendar date, String reason, String name, Integer age, String phone, String gender) {

        this.user = user;
        this.consultant = consultant;
        this.approach = approach;
        this.state = AppointmentStatus.WAITING;
        this.date = date;
        this.reason = reason;
        this.name = name;
        this.age = age;
        this.phone = phone;
        this.gender = gender;
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
    public String getSummary() {
        return this.getReason();
    }


    @Override
    public List<User> sendTo() {
        User user = this.getUser();
        User consultant = this.getConsultant();
        List<User> users = new ArrayList<User>();

        if (consultant != null) {
            users.add(consultant);
        }

        if (user != null) {
            users.add(user);
        }

        return users;

    }

    @PrePersist
    public void fillDefaultUser(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User login = (User) authentication.getPrincipal();
        this.user = login;
    }
}
