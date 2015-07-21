package com.huixinpn.dionysus.domain.psychtest.projection;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import com.huixinpn.dionysus.domain.user.projection.UserSummary;

@Projection(name = "summary", types = PsychTestResult.class)
public interface PsychTestResultSummary {
	
	public Long getId();

	public PsychTestSummary getTest();

	public UserSummary getcreatedBy();

}
