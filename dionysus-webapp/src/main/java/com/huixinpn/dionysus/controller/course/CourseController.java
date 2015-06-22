package com.huixinpn.dionysus.controller.course;

import com.huixinpn.dionysus.controller.util.PagingHelper;
import com.huixinpn.dionysus.controller.util.Utils;
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

import java.util.ArrayList;
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

  public static final String EMPTY_JSON_OBJECT = Utils.EMPTY_JSON_OBJECT;


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

  @RequestMapping(value = "/courses/me", method = RequestMethod.GET)
  public Collection<CourseData> myCourses() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User login = (User) authentication.getPrincipal();
    User reloaded = userRepository.findOne(login.getId());
    return new EntityCollectionData<>(reloaded.getCourses(), CourseData.class).toDTOCollection();
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

  @RequestMapping(value = "/courses/categories/tree", method = RequestMethod.GET)
  public
  @ResponseBody
  Collection<CourseCategoryData> listCategoriesTree() {
    Collection<CourseCategory> categories = courseCategoryRepository.findRootCategories();
    return new EntityCollectionData<>(categories, CourseCategoryData.class).toDTOCollection();
  }

  @RequestMapping(value = "/courses/categories", method = RequestMethod.POST)
  public
  @ResponseBody
  ResponseEntity<String> addCategory(@RequestBody CourseCategoryData data) {
    CourseCategory adding = new CourseCategory();
    data.update(adding);
    CourseCategory added = courseCategoryRepository.save(adding);
    return new ResponseEntity<>(Utils.wrapSaveResult(added.getId()), HttpStatus.OK);
  }

  @RequestMapping(value = "/courses/categories/{id}", method = RequestMethod.GET)
  public
  @ResponseBody
  CourseCategoryData getCategory(@PathVariable Long id) {
    CourseCategory category = courseCategoryRepository.findOne(id);
    return new CourseCategoryData(category);
  }

  @RequestMapping(value = "/courses/categories/{id}", method = {RequestMethod.PUT, RequestMethod.POST})
  public
  @ResponseBody
  ResponseEntity<String> updateCategory(@RequestBody CourseCategoryData data, @PathVariable Long id) {
    if (!id.equals(data.getId())) {
      return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }
    CourseCategory updating = courseCategoryRepository.findOne(id);
    data.update(updating);
    courseCategoryRepository.save(updating);
    return new ResponseEntity(EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/courses/categories/{id}", method = RequestMethod.DELETE)
  public
  @ResponseBody
  ResponseEntity<String> deleteCategory(@PathVariable Long id) {
    courseCategoryRepository.delete(id);
    return new ResponseEntity(EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/courses/{id}", method = RequestMethod.DELETE)
  public
  @ResponseBody
  ResponseEntity<String> deleteCourse(@PathVariable Long id) {
    courseRepository.delete(id);
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
    CourseCategory root = courseCategoryRepository.findOne(cid);
    Collection<CourseCategory> categories = getCategoryTree(root);

    if (approach != null) {
      pagedCourses = courseRepository.findByCategoryAndApproach(categories, approach, paging);
    } else {
      pagedCourses = courseRepository.findByCategory(categories, paging);
    }
    return new EntityPageData<>(pagedCourses, CourseData.class);
  }

  private Collection<CourseCategory> getCategoryTree(CourseCategory root) {
    if (root == null) {
      return new ArrayList<>();
    } else {
      List<CourseCategory> result = new ArrayList<>();
      Collection<CourseCategory> children = root.getChildren();
      for (CourseCategory child : children) {
        result.addAll(getCategoryTree(child));
      }
      result.add(root);
      return result;
    }
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
    return new EntityCollectionData<>(tags, TagData.class).toDTOCollection();
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
    Course updating = courseRepository.findOne(id);
    data.update(updating);
    courseRepository.save(updating);
    return new ResponseEntity(EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/courses", method = RequestMethod.POST)
  public
  @ResponseBody
  ResponseEntity<String> addCourse(@RequestBody CourseData data) {
    Course adding = new Course();
    data.update(adding);
    Course added = courseRepository.save(adding);
    return new ResponseEntity<>(Utils.wrapSaveResult(added.getId()), HttpStatus.OK);
  }

  @RequestMapping(value = "/courses/slider", method = RequestMethod.GET)
  public
  @ResponseBody
  Collection<CourseData> slider() {
    Collection<Course> courses = courseRepository.findByLocation("slider");
    return new EntityCollectionData<>(courses,CourseData.class).toDTOCollection();
  }
}
