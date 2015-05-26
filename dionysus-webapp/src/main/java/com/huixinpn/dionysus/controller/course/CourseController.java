package com.huixinpn.dionysus.controller.course;

import com.huixinpn.dionysus.controller.util.PagingHelper;
import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseApproach;
import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.tag.Tag;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityCollectionData;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.dto.course.CourseCategoryData;
import com.huixinpn.dionysus.dto.course.CourseData;
import com.huixinpn.dionysus.dto.tag.TagData;
import com.huixinpn.dionysus.dto.user.ConsultantData;
import com.huixinpn.dionysus.repository.course.CourseCategoryRepository;
import com.huixinpn.dionysus.repository.course.CourseRepository;
import com.huixinpn.dionysus.repository.tag.TagRepository;
import com.huixinpn.dionysus.repository.user.ConsultantRepository;
import com.huixinpn.dionysus.repository.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.List;

@RestController
@RequestMapping(value = "/controllers")
public class CourseController {
  @Autowired
  private CourseRepository courseRepository;

  @Autowired
  private TagRepository tagRepository;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private CourseCategoryRepository courseCategoryRepository;

  @Autowired
  private ConsultantRepository consultantRepository;

  public static final String EMPTY_JSON_OBJECT = "{}";


  @RequestMapping(value = "/courses/{id}/reg", method = RequestMethod.GET)
  public ResponseEntity<String> registerCourse(@PathVariable Long id) {
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
    return new ResponseEntity<>(EMPTY_JSON_OBJECT, HttpStatus.OK);
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

  @RequestMapping(value = "/courses/categories", method = RequestMethod.GET)
  public
  @ResponseBody
  Collection<CourseCategoryData> listCategories() {
    List<CourseCategory> categories = courseCategoryRepository.findAll();
    return new EntityCollectionData<>(categories, CourseCategoryData.class).toDTOCollection();
  }

  @RequestMapping(value = "/courses/categories/{id}", method = {RequestMethod.PUT, RequestMethod.POST})
  public
  @ResponseBody
  ResponseEntity<String> updateCategory(@RequestBody CourseCategoryData data, @PathVariable Long id) {
    if (!id.equals(data.getId())) {
      return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }
    courseCategoryRepository.save(data.toEntity());
    return new ResponseEntity(EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/courses/consultants", method = RequestMethod.GET)
  public
  @ResponseBody
  Collection<ConsultantData> listConsultants() {
    List<Consultant> consultants = consultantRepository.findAll();
    return new EntityCollectionData<>(consultants, ConsultantData.class).toDTOCollection();
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

  @RequestMapping(value = "/courses/tags", method = RequestMethod.GET)
  public
  @ResponseBody
  EntityPageData<TagData> getCourseTags(@RequestParam(value = "page", required = false) Integer page,
                                        @RequestParam(value = "size", required = false) Integer size) {
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Page<Tag> tags = tagRepository.findAllCourseTags(paging);
    return new EntityPageData<>(tags, TagData.class);
  }

  @RequestMapping(value = "/courses/tags/top", method = RequestMethod.GET)
  public
  @ResponseBody
  Collection<TagData> getTopTags(@RequestParam(value = "n") Integer topN) {
    List<Tag> tags = tagRepository.findTopNTagForCourse(topN);
    return new EntityCollectionData<>(tags,TagData.class).toDTOCollection();
  }


  @RequestMapping(value = "/courses/tag/{tid}", method = RequestMethod.GET)
  public
  @ResponseBody
  EntityPageData<CourseData> searchCoursesByTag(@RequestParam(value = "page", required = false) Integer page,
                                                @RequestParam(value = "size", required = false) Integer size,
                                                @RequestParam(value = "approach", required = false) CourseApproach approach,
                                                @PathVariable Long tid) {
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Page<Course> courses;
    if (approach != null) {
      courses = courseRepository.findByTagAndApproach(tid, approach, paging);
    } else {
      courses = courseRepository.findByTag(tid, paging);
    }
    return new EntityPageData<>(courses, CourseData.class);
  }

  @RequestMapping(value = "/courses/{id}", method = RequestMethod.GET)
  public
  @ResponseBody
  CourseData listCourse(@PathVariable Long id) {
    Course course = courseRepository.findOne(id);
    return new CourseData(course);
  }

  @RequestMapping(value = "/courses/{id}", method = {RequestMethod.PUT, RequestMethod.POST})
  public
  @ResponseBody
  ResponseEntity<String> updateCourse(@RequestBody CourseData data, @PathVariable Long id) {
    if (!id.equals(data.getId())) {
      return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }
    Course updating = data.toEntity();
    courseRepository.save(updating);
    return new ResponseEntity(EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/courses", method = RequestMethod.POST)
  public
  @ResponseBody
  ResponseEntity<String> addCourse(@RequestBody CourseData data) {
    Course adding = data.toEntity();
    courseRepository.save(adding);
    return new ResponseEntity<>(EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

}
