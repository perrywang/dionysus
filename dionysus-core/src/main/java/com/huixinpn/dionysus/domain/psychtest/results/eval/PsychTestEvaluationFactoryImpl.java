package com.huixinpn.dionysus.domain.psychtest.results.eval;

import com.huixinpn.dionysus.domain.psychtest.PsychTestType;
import com.huixinpn.dionysus.domain.psychtest.results.PsychTestEvaluationFactory;
import com.huixinpn.dionysus.domain.psychtest.results.PsychTestEvaluationStrategy;

public class PsychTestEvaluationFactoryImpl implements PsychTestEvaluationFactory {

	public PsychTestEvaluationStrategy create(PsychTestType category) {
		switch (category) {
		case PF16:
			return new PF16EvaluationStrategoy();
		default:
			throw new RuntimeException("unknown pschtest category");
		}
	}
}
