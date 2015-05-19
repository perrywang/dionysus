package com.huixinpn.dionysus.controller.course;

import com.huixinpn.dionysus.controller.util.PagingHelper;
import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseApproach;
import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.tag.Tag;
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
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Page<Course> pagedCourses = courseRepository.findAll(paging);
    return new EntityPageData<>(pagedCourses, CourseData.class);
  }

  @RequestMapping(value = "/courses/category/{cid}", method = RequestMethod.GET)
  public
  @ResponseBody
  EntityPageData<CourseData> searchCoursesByCategory(@RequestParam(value = "page", required = false) Integer page,
                                                     @RequestParam(value = "size", required = false) Integer size,
                                                     @RequestParam(value = "approach", required = false) CourseApproach approach,
                                                     @PathVariable Long cid) {
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Page<Course> pagedCourses;
    if (approach != null) {
      pagedCourses = courseRepository.findByCategoryAndApproach(new CourseCategory(cid), approach, paging);
    } else {
      pagedCourses = courseRepository.findByCategory(new CourseCategory(cid), paging);
    }
    return new EntityPageData<>(pagedCourses, CourseData.class);
  }

  @RequestMapping(value = "/courses/tag/{tid}", method = RequestMethod.GET)
  public
  @ResponseBody
  EntityPageData<CourseData> searchCoursesByTag(@RequestParam(value = "page", required = false) Integer page,
                                                @RequestParam(value = "size", required = false) Integer size,
                                                @RequestParam(value = "approach", required = false) CourseApproach approach,
                                                @PathVariable Long tid) {
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Page<Course> pagedCourses;
    if (approach != null) {
      pagedCourses = courseRepository.findByTagAndApproach(new Tag(tid),approach,paging);
    } else {
      Course tmp = courseRepository.findOne(1L);
      pagedCourses = courseRepository.findByTag(new Tag(tid), paging);
    }
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
