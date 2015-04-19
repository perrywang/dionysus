package com.huixinpn.dionysus.repository;

import com.huixinpn.dionysus.domain.course.CourseOffline;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseOfflineRepository extends JpaRepository<CourseOffline, Long>{
}
