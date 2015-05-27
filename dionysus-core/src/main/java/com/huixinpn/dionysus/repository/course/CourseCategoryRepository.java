package com.huixinpn.dionysus.repository.course;

import com.huixinpn.dionysus.domain.course.CourseCategory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface CourseCategoryRepository extends JpaRepository<CourseCategory, Long> {
  @Query(value = "select c from CourseCategory c where c.parent is null")
  Collection<CourseCategory> findRootCategories();
}
