package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RestResource;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.psychtest.PsychTestSuite;

@Repository
@RestResource(path = "psychtestsuites", rel = "psychtestsuites")
public interface PsychTestSuiteRepository extends
		JpaRepository<PsychTestSuite, Long> {

}
