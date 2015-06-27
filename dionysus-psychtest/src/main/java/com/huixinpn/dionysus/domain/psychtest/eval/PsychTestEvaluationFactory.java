package com.huixinpn.dionysus.domain.psychtest.eval;

import com.huixinpn.dionysus.domain.psychtest.PsychTest.PsychTestType;

public interface PsychTestEvaluationFactory {

	PsychTestEvaluationStrategy create(PsychTestType category);

}
