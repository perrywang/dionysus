package com.huixinpn.dionysus.domain.psychtest.eval;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;

public class PsychTestEvaluator {
	
	// TODO: use Spring to manage this bean
	private PsychTestEvaluationFactory factory = new PsychTestEvaluationFactoryImpl();

	public void evaluate(PsychTestResult result) {
		PsychTest test = result.getTest();
		PsychTestEvaluationStrategy strategy = factory.create(test.getType());
		strategy.evaluate(result);
	}
}
