package com.huixinpn.dionysus.repository;

import com.huixinpn.dionysus.domain.CourseFeedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseFeedbackRepository extends JpaRepository<CourseFeedback, Long> {
}
