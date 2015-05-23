package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;

@Projection(name = "excerpt", types = PsychTestQuestionOption.class)
public interface PsychTestQuestionOptionExcerpt {

	Long getId();

	String getDescription();
}
