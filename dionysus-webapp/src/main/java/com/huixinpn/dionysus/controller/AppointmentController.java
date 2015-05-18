package com.huixinpn.dionysus.controller;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.repository.appointment.AppointmentRepository;

/**
 * Created by huanghao on 4/6/15.
 */
@RestController
public class AppointmentController {

    @Autowired
    @Qualifier("appointmentRepository")
    private AppointmentRepository repository;

    @PersistenceContext
    private EntityManager manager;

    @RequestMapping(value = "/appointments", method = RequestMethod.POST)
    public Appointment addAppointment(@RequestBody Appointment appointment){
        repository.save(appointment);
        manager.detach(appointment);
        return appointment;
    }
}
