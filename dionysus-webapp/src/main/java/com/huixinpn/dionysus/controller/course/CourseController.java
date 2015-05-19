package com.huixinpn.dionysus.controller.course;

import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.dto.course.CourseData;
import com.huixinpn.dionysus.repository.course.CourseRepository;
import com.huixinpn.dionysus.repository.tag.TagRepository;
import com.huixinpn.dionysus.repository.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CourseController {
  @Autowired
  private CourseRepository courseRepository;

  @Autowired
  private TagRepository tagRepository;

  @Autowired
  private UserRepository userRepository;

  @RequestMapping(value = "/courses/{id}/reg", method = RequestMethod.GET)
  public ResponseEntity<Void> registerColurse(@PathVariable Long id) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    Object principle = authentication.getPrincipal();
    if (!(principle instanceof User)) {
      return new ResponseEntity<>(HttpStatus.FORBIDDEN);
    }
    User login = (User) authentication.getPrincipal();
    User reloaded = userRepository.findOne(login.getId());
    Course course = courseRepository.findOne(id);
    if (course != null &&
        (course.getCapacity() == null || course.getUsers().size() < course.getCapacity()) &&
        !reloaded.getCourses().contains(course)) {
      course.getUsers().add(reloaded);
      courseRepository.save(course);
    }
    return new ResponseEntity<>(HttpStatus.OK);
  }

  @RequestMapping(value = "/courses", method = RequestMethod.GET)
  public
  @ResponseBody
  EntityPageData<CourseData> listCourses(@RequestParam(value = "page", required = false) Integer page,
                                         @RequestParam(value = "size", required = false) Integer size) {
    int pageSize = (size == null ? EntityPageData.getDefaultPageSize() : size);
    int pageNumber = (page == null ? 0 : page);
    Page<Course> pagedCourses = courseRepository.findAll(new PageRequest(pageNumber, pageSize));
    return new EntityPageData<>(pagedCourses, CourseData.class);
  }

  @RequestMapping(value = "/courses/{id}", method = RequestMethod.GET)
  public
  @ResponseBody
  CourseData listCourse(@PathVariable Long id) {
    Course course = courseRepository.findOne(id);
    return new CourseData(course);
  }
}
