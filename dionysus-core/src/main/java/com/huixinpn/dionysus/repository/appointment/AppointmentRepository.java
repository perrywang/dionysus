package com.huixinpn.dionysus.repository.appointment;

import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.domain.appointment.AppointmentStatus;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {

  @PreAuthorize("#user.username == principal.username or hasRole('ADMIN')")
  List<Appointment> findByUser(@Param("user") User user);

  @Query(value = "select a from Appointment a where a.consultant = ?1 and a.state = ?2 order by a.date desc")
  Page<Appointment> findByConsultantAndState(Consultant consultant, AppointmentStatus status, Pageable pageable);

  @Query(value = "select a from Appointment a where a.consultant = ?1 order by a.state asc, a.date desc")
  Page<Appointment> findByConsultant(Consultant consultant, Pageable pageable);

  Page<Appointment> findByState(AppointmentStatus state, Pageable pageable);

  @Query(value = "select a from Appointment a order by a.date desc")
  Page<Appointment> findAll(Pageable pageable);

  Page<Appointment> findByUser(User user, Pageable pageable);
}
