package com.huixinpn.dionysus.repository.course;

import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.user.Consultant;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.course.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

	Page<Course> findByCategory(@Param("cid") CourseCategory category, Pageable pagable);

	Page<Course> findByConsultant(@Param("id") Consultant consultant, Pageable pageable);

}
