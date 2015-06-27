package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;

@RepositoryRestResource(path = "psychtestquestions", 
	collectionResourceRel = "psychtestquestions",
	itemResourceRel = "psychtestquestion",
	excerptProjection = PsychTestQuestionExcerpt.class)
public interface PsychTestQuestionRepository extends
		JpaRepository<PsychTestQuestion, Long> {

}
