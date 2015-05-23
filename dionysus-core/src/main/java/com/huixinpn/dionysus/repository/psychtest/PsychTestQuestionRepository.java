package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;

@Repository
@RepositoryRestResource(
	collectionResourceRel = "questions", 
	itemResourceRel = "question",
	excerptProjection = EmbeddedPsychTestQuestionExcerpt.class)
public interface PsychTestQuestionRepository extends JpaRepository<PsychTestQuestion, Long>{

}
