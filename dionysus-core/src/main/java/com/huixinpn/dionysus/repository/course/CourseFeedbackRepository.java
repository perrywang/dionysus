package com.huixinpn.dionysus.repository.course;

import com.huixinpn.dionysus.domain.course.CourseFeedback;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseFeedbackRepository extends JpaRepository<CourseFeedback, Long> {
}
