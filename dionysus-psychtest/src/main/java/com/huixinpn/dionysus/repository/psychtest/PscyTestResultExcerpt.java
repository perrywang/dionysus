package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestResult.PsychTestState;

public interface PscyTestResultExcerpt {
	
	Long getId();
	
	PsychTestState getState();
}
