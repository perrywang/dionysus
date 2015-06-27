package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import com.huixinpn.dionysus.domain.psychtest.results.PsychTestResult;

@RepositoryRestResource(path = "psychtestresults", 
	collectionResourceRel = "psychtestresults", 
	itemResourceRel = "psychtestresult")
public interface PsychTestResultRepository
	extends JpaRepository<PsychTestResult, Long> {

	@RestResource(path = "mine")
	@Query("select p from PsychTestResult p")
	public Iterable<PsychTestResult> findAllMineTestResults();
	
//	@RestResource(path = "mine")
//	@Query("select p from PsychTestResult p where p.test = ?1")
//	public PsychTestResult findMineTestResult(PsychTest test);

}
