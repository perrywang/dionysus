package com.huixinpn.dionysus.repository.psychtest.proj;

import java.util.Collection;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestSuite;

@Projection(name = "inlinePsychTestSuite", types = PsychTestSuite.class)
public interface InlinePsychTest {

	public String getTitle();

	public String getDescription();

	public Collection<PsychTest> getTests();
}
