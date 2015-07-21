package com.huixinpn.dionysus.domain.psychtest.projection;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;

@Projection(name = "summary", types = PsychTest.class)
public interface PsychTestSummary {
	public Long getId();

	public String getTitle();

}
