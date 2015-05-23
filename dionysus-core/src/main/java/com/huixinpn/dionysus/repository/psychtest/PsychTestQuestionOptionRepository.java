package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;

@RepositoryRestResource( 
	collectionResourceRel = "options", 
	itemResourceRel = "option",
	excerptProjection = EmbeddedPsychTestQuestionOptionExcerpt.class)
public interface PsychTestQuestionOptionRepository extends
		JpaRepository<PsychTestQuestionOption, Long> {

}
