package com.huixinpn.dionysus.controller.appointment;

import com.huixinpn.dionysus.controller.util.PagingHelper;
import com.huixinpn.dionysus.controller.util.Utils;
import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.domain.appointment.AppointmentStatus;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.dto.appointment.AppointmentData;
import com.huixinpn.dionysus.repository.appointment.AppointmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/controllers")
public class AppointmentController {

  @Autowired
  private AppointmentRepository appointmentRepository;

  @RequestMapping(value = "/appointments", method = RequestMethod.POST)
  public ResponseEntity<String> addAppointment(@RequestBody AppointmentData data) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User login = (User) authentication.getPrincipal();
    Appointment appointment = new Appointment();
    data.update(appointment);
    appointment.setUser(login);
    Appointment added = appointmentRepository.save(appointment);
    return new ResponseEntity<>(Utils.wrapSaveResult(added.getId()), HttpStatus.OK);
  }

  @RequestMapping(value = "/appointments/{id}", method = RequestMethod.PUT)
  public ResponseEntity<String> updateAppointment(@RequestBody AppointmentData data,@PathVariable Long id) {
    Appointment updating = appointmentRepository.findOne(id);
    data.update(updating);
    appointmentRepository.save(updating);
    return new ResponseEntity<>(Utils.EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/appointments", method = RequestMethod.GET)
  public EntityPageData<AppointmentData> getAppointments(@RequestParam(value="c",required = false) Long consultId,
                                                @RequestParam(value="s", required = false) String state,
                                                @RequestParam(value = "page", required = false) Integer page,
                                                @RequestParam(value = "size", required = false) Integer size)
  {
    Pageable pageable = PagingHelper.getPageRequest(page,size);
    Page<Appointment> result;
    if(consultId == null && state == null){
      result = appointmentRepository.findAll(pageable);
    }else if(consultId == null){
      result = appointmentRepository.findByState(AppointmentStatus.valueOf(state),pageable);
    }else if(state == null){
      result = appointmentRepository.findByConsultant(new Consultant(consultId),pageable);
    }else{
      result = appointmentRepository.findByConsultantAndState(new Consultant(consultId),AppointmentStatus.valueOf(state),pageable);
    }

    return new EntityPageData<>(result,AppointmentData.class);
  }

  @RequestMapping(value = "/appointments/{id}", method = RequestMethod.GET)
  public AppointmentData getAppointment(@PathVariable Long id)
  {
     return new AppointmentData(appointmentRepository.findOne(id));
  }

  @RequestMapping(value = "/appointments/user/{id}", method = RequestMethod.GET)
  public EntityPageData<AppointmentData> getAppointmentByUser(@PathVariable Long id,@RequestParam Integer page, @RequestParam Integer size)
  {
    Pageable pageable = PagingHelper.getPageRequest(page,size);
    return new EntityPageData(appointmentRepository.findByUser(new User(id),pageable),AppointmentData.class);
  }

}
