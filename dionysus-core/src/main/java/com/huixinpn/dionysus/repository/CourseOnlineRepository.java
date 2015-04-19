package com.huixinpn.dionysus.repository;

import com.huixinpn.dionysus.domain.course.CourseOnline;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseOnlineRepository extends JpaRepository<CourseOnline, Long> {
}
