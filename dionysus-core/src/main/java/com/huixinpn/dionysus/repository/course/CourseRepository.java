package com.huixinpn.dionysus.repository.course;

import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseApproach;
import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.user.Consultant;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

  Page<Course> findByCategory(@Param("cid") CourseCategory category, Pageable pagable);

  @Query(value = "select c from Course c where c.category in ?1 and c.state = 'OPEN'")
  Page<Course> findByCategory(Collection<CourseCategory> categories, Pageable pagable);

  Page<Course> findByCategoryAndApproach(CourseCategory category, CourseApproach approach, Pageable pagable);

  @Query(value = "select c from Course c where c.category in ?1 and c.approach = ?2 and c.state = 'OPEN'")
  Page<Course> findByCategoryAndApproach(Collection<CourseCategory> category, CourseApproach approach, Pageable pagable);

  Page<Course> findByConsultant(@Param("id") Consultant consultant, Pageable pageable);

  @Query(value = "select c from Course as c, Course_Tag as t where c.id = t.courses_id and t.tags_id = ?1")
  Page<Course> findByTag(Long tagId,Pageable pageable);

  @Query(value = "select c from Course as c, Course_Tag as t where c.id = t.courses_id and t.tags_id = ?1 and c.approach = ?2")
  Page<Course> findByTagAndApproach(Long tagId, CourseApproach approach, Pageable pageable);

  Collection<Course> findByLocation(String location);
}
