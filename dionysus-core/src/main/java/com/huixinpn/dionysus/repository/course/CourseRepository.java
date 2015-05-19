package com.huixinpn.dionysus.repository.course;

import com.huixinpn.dionysus.domain.course.CourseApproach;
import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.tag.Tag;
import com.huixinpn.dionysus.domain.user.Consultant;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.course.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

	Page<Course> findByCategory(@Param("cid") CourseCategory category, Pageable pagable);

	Page<Course> findByCategoryAndApproach(CourseCategory category, CourseApproach approach, Pageable pagable);

	Page<Course> findByConsultant(@Param("id") Consultant consultant, Pageable pageable);

	@Query(value = "select c from Course c where ?1 in c.tags")
	Page<Course> findByTag(Tag tag, Pageable pageable);

	@Query(value = "select c from Course c where ?1 in c.tags and c.approach = ?2")
	Page<Course> findByTagAndApproach(Tag tag,CourseApproach approach, Pageable pageable);
}
