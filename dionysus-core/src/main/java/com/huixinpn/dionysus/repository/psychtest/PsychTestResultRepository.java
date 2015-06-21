package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.psychtest.results.PsychTestResult;

@RepositoryRestResource(path = "psychtestresults", 
	collectionResourceRel = "psychtestresults", 
	itemResourceRel = "psychtestresult")
public interface PsychTestResultRepository extends JpaRepository<PsychTestResult, Long> {

}
