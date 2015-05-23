package com.huixinpn.dionysus.repository.psychtest.proj;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;

@Projection(name = "excerpt", types = { PsychTest.class })
public interface PsychTestExcerpt {

	public String getTitle();
	
	public String getDescription();
}
