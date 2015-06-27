package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.results.PsychTestResult;

@RepositoryRestResource(path = "psychtestresults", 
	collectionResourceRel = "psychtestresults", 
	itemResourceRel = "psychtestresult")
public interface PsychTestResultRepository extends JpaRepository<PsychTestResult, Long> {

	// 查询当前用户的历史心理测试记录
	@Query("select c from PsychTestResult c where c.test = ?1")
	public PsychTestResult findByPsychTest(PsychTest test);
}
