package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;

@RepositoryRestResource(path = "psychtestresults", 
	collectionResourceRel = "psychtestresults", 
	itemResourceRel = "psychtestresult",
	excerptProjection = PscyTestResultExcerpt.class )
public interface PsychTestResultRepository
	extends Repository<PsychTestResult, Long> {

	// 当前用户可以查看自己的测试结果，或者管理员可以查看所有的测试结果
	@Query("select o from PsychTestResult o where o.test.id = ?1 and (o.createdBy.id = ?#{principal.id} or 1=?#{hasRole('ROLE_ADMIN') ? 1 : 0}))")
	PsychTestResult findOne(Long id);
	
	@Query("select o from PsychTestResult o where (o.createdBy.id = ?#{principal.id} or 1=?#{hasRole('ROLE_ADMIN') ? 1 : 0})")
	Iterable<PsychTestResult> findAll();
}
