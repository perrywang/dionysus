package com.huixinpn.dionysus.domain.psychtest.projection;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import com.huixinpn.dionysus.domain.user.projection.UserSummary;

import java.util.Calendar;

@Projection(name = "summary", types = PsychTestResult.class)
public interface PsychTestResultSummary {
	
	public Long getId();

	public PsychTestSummary getTest();

	public UserSummary getcreatedBy();

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm")
    public Calendar getCreatedDate();

    public PsychTestResult.PsychTestState getState();


}
