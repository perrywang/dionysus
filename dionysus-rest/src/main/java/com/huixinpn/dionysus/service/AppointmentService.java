package com.huixinpn.dionysus.service;

import com.huixinpn.dionysus.repository.appointment.AppointmentRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * Created by huanghao on 4/5/15.
 */

@RepositoryRestResource(collectionResourceRel = "appointments", path="appointments")
public interface AppointmentService extends AppointmentRepository {
}
