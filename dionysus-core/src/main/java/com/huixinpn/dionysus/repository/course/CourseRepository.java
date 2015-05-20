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

import java.util.Collection;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

	Page<Course> findByCategory(@Param("cid") CourseCategory category, Pageable pagable);

	Page<Course> findByCategoryAndApproach(CourseCategory category, CourseApproach approach, Pageable pagable);

	Page<Course> findByConsultant(@Param("id") Consultant consultant, Pageable pageable);

	@Query(value = "select * from courses c join tags_courses t on c.id = t.courses_id where t.tags_id = ?1 limit ?2 offset ?3", nativeQuery = true)
	Collection<Course> findByTag(Long tagId, Long count, Long offset);

	@Query(value = "select * from courses c join tags_courses t on c.id = t.courses_id where t.tags_id = ?1 and c.approach=?2 limit ?3 offset ?4", nativeQuery = true)
	Collection<Course> findByTagAndApproach(Long tagId, String approach, Long count, Long offset);

	@Query(value = "select count(*) from courses c join tags_courses t on c.id = t.courses_id where t.tags_id = ?1", nativeQuery = true)
	Long countByTag(Long tagId);

	@Query(value = "select * from courses c join tags_courses t on c.id = t.courses_id where t.tags_id = ?1 and c.approach=?2", nativeQuery = true)
	Long countByTagAndApproach(Long tagId,String approach);
}
