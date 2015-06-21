package com.huixinpn.dionysus.domain.appointment.projection;

import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.domain.appointment.AppointmentApproach;
import com.huixinpn.dionysus.domain.appointment.AppointmentStatus;
import com.huixinpn.dionysus.domain.user.projection.ConsultantExcerpt;
import org.joda.time.DateTime;
import org.springframework.data.rest.core.config.Projection;

/**
 * Created by huanghao on 6/22/15.
 */
@Projection(name="myappointment", types = Appointment.class)
public interface MyAppointment {

    AppointmentStatus getState();
    AppointmentApproach getApproach();
    DateTime getDate();
    String  getName();
    ConsultantExcerpt getConsultant();

}
