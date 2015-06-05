package com.huixinpn.dionysus.repository.user;

import com.huixinpn.dionysus.domain.appointment.AppointmentStatus;
import com.huixinpn.dionysus.domain.user.Consultant;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConsultantRepository extends JpaRepository<Consultant, Long> {
  @Override
  @PreAuthorize("#user.username == principal or hasRole('ADMIN')")
  <T extends Consultant> T save(T user);

  @Override
  @PreAuthorize("#user.username == principal or hasRole('ADMIN')")
  void delete(Consultant user);

  @Override
  @PreAuthorize("#id == authentication.details or hasRole('ADMIN')")
  void delete(Long id);

  @Query(value = "select c from Consultant c where size(c.appointments) > 0 order by size(c.appointments) desc")
  Page<Consultant> findConsultantsHasAppointments(Pageable pageable);

  @Query(value = "select c from Consultant c where c.expertise like %:expertise%")
  Page<Consultant> findConsultantsByExpertise(@Param("expertise") String expertise, Pageable pageable);
  
  @Query(value = "select c from Consultant c where c.username like %:name%")
  List<Consultant> nameContains(@Param("name") String name);

  @Override
  @Query(value = "select c from Consultant c order by size(c.appointments) desc")
  Page<Consultant> findAll(Pageable pageable);

  @Query(value = "select c from Consultant c join c.appointments a where a.state = ?1 and size(c.appointments) > 0 order by size(c.appointments) desc")
  Page<Consultant> findConsultantsOrderByAppointmentState(AppointmentStatus state, Pageable pageable);

}
