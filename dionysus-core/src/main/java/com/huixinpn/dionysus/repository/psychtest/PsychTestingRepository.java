package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.results.PsychTesting;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PsychTestingRepository extends JpaRepository<PsychTesting, Long> {
}
