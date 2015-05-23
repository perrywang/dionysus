package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTestSuite;

@Projection(name = "excerpt", types = PsychTestSuite.class)
public interface PsychTestSuiteExcerpt {

	String getTitle();

	String getDescription();
}
