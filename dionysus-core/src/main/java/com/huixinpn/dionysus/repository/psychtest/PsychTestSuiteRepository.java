package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.psychtest.PsychTestSuite;

@RepositoryRestResource(path = "psychtestsuites",
	collectionResourceRel = "psychtestsuites",
	itemResourceRel = "psychtestsuite",
	excerptProjection = PsychTestSuiteExcerpt.class)
public interface PsychTestSuiteRepository extends
		JpaRepository<PsychTestSuite, Long> {

}
