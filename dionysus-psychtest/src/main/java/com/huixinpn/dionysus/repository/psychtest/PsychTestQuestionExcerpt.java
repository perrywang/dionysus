package com.huixinpn.dionysus.repository.psychtest;

import java.util.Collection;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion.PsychTestQuestionType;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;

@Projection(name = "excerpt", types = PsychTestQuestion.class)
public interface PsychTestQuestionExcerpt {
	
	Long getId();
	
	Integer getSubId();

	String getDescription();
	
	PsychTestQuestionType getType();

	Collection<PsychTestQuestionOption> getOptions();
}
