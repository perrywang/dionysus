package com.huixinpn.dionysus.controller;

import com.huixinpn.dionysus.domain.Appointment;
import com.huixinpn.dionysus.repository.AppointmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by huanghao on 4/6/15.
 */


@RestController
public class AppointmentController {

    @Autowired
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
