package com.huixinpn.dionysus.repository.course;

import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseFeedback;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface CourseFeedbackRepository extends JpaRepository<CourseFeedback, Long> {

  @Query(value = "select f from CourseFeedback f where f.course = ?1 order by f.createdDate desc")
  Collection<CourseFeedback> findByCourse(Course course);

}
