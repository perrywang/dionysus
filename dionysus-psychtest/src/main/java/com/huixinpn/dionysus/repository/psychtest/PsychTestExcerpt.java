package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;

@Projection(name = "excerpt", types = { PsychTest.class })
public interface PsychTestExcerpt {
	
	Long getId();

	String getTitle();

	String getDescription();
	
	String getObject();

    String getComment();
}
