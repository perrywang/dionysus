package com.huixinpn.dionysus.domain.psychtest.results;

import com.huixinpn.dionysus.domain.psychtest.PsychTestType;

public interface PsychTestEvaluationFactory {

	PsychTestEvaluationStrategy create(PsychTestType category);

}
