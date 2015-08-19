package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.psychtest.PsychTestAnswer;

import java.util.List;

@RepositoryRestResource(
    path = "psychtestanswers", 
    collectionResourceRel = "psychtestanswers", 
    itemResourceRel = "psychtestanswers", 
    excerptProjection = PsychTestAnswerExcerpt.class)
public interface PsychTestAnswerRepository 
  extends JpaRepository<PsychTestAnswer, Long> {

    @Query("select o from PsychTestAnswer o where o.result = :result order by o.question.id asc")
    List<PsychTestAnswer> findByResult(@Param("result") PsychTestResult result);
}
