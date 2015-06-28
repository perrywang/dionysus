package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.psychtest.PsychTestAnswer;

@RepositoryRestResource(
    path = "psychtestanswers", 
    collectionResourceRel = "psychtestanswers", 
    itemResourceRel = "psychtestanswers", 
    excerptProjection = PsychTestAnswerExcerpt.class)
public interface PsychTestAnswerRepository 
  extends JpaRepository<PsychTestAnswer, Long> {

}
