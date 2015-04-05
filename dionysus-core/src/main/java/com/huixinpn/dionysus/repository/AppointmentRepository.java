package com.huixinpn.dionysus.repository;

import java.util.List;

import com.huixinpn.dionysus.domain.Appointment;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.User;

/**
 * Created by huanghao on 4/5/15.
 */

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long>{
    List<Appointment> findByUser(@Param("user") User user);
    List<Appointment> findByConsultant(@Param("consultant") User consultant);

}
