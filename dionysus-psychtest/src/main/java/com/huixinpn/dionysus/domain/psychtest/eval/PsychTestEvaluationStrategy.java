package com.huixinpn.dionysus.domain.psychtest.eval;

import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;

public interface PsychTestEvaluationStrategy {

	Object evaluate(PsychTestResult result);
}
