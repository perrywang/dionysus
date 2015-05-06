package com.huixinpn.dionysus.controller.course;

import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.repository.CourseRepository;
import com.huixinpn.dionysus.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class CourseController {
  @Autowired
  private CourseRepository courseRepository;

  @Autowired
  private UserRepository userRepository;

  @RequestMapping(value = "/course/registration/{id}", method = RequestMethod.GET)
  public ResponseEntity registerColurse(@PathVariable Long id) throws Exception {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User login = (User) authentication.getPrincipal();
    User reloaded = userRepository.findOne(login.getId());
    Course course = courseRepository.findOne(id);
    if (course != null &&
        (course.getCapacity() == null || course.getUsers().size() < course.getCapacity()) &&
        !reloaded.getCourses().contains(course)) {
      reloaded.getCourses().add(course);
      userRepository.save(reloaded);
    }
    return new ResponseEntity(HttpStatus.OK);
  }
}
