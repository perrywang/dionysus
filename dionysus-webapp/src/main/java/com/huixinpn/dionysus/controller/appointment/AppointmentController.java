package com.huixinpn.dionysus.controller.appointment;

import com.huixinpn.dionysus.controller.util.Utils;
import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.repository.appointment.AppointmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/controllers")
public class AppointmentController {

  @Autowired
  private AppointmentRepository repository;

  @RequestMapping(value = "/appointments", method = RequestMethod.POST)
  public ResponseEntity<String> addAppointment(@RequestBody Appointment appointment) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User login = (User) authentication.getPrincipal();
    appointment.setUser(login);
    Appointment added = repository.save(appointment);
    return new ResponseEntity<>(Utils.wrapSaveResult(added.getId()), HttpStatus.OK);
  }

  @RequestMapping(value = "/appointments", method = RequestMethod.PUT)
  public ResponseEntity<String> updateAppointment(@RequestBody Appointment appointment) {
    repository.save(appointment);
    return new ResponseEntity<>(Utils.EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/appointments", method = RequestMethod.GET)
  public ResponseEntity<String> getAppointments(@RequestParam(value="c",required = false) Long consultId, @RequestParam(value="s", required = false) String state) {
    return new ResponseEntity<>(Utils.EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

}
