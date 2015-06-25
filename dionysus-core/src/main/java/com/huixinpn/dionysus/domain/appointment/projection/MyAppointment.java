package com.huixinpn.dionysus.domain.appointment.projection;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.domain.appointment.AppointmentApproach;
import com.huixinpn.dionysus.domain.appointment.AppointmentStatus;
import com.huixinpn.dionysus.domain.user.projection.ConsultantExcerpt;
import org.springframework.data.rest.core.config.Projection;

import java.util.Calendar;

/**
 * Created by huanghao on 6/22/15.
 */
@Projection(name="myappointment", types = Appointment.class)
public interface MyAppointment {

    Long getId();

    String getReason();
    String  getName();
    Integer getAge();
    String getPhone();
    String getEmail();
    String getGender();
    String getFeedBack();


    AppointmentStatus getState();
    AppointmentApproach getApproach();

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm")
    Calendar getDate();


    ConsultantExcerpt getConsultant();

}
