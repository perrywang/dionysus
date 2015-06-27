package com.huixinpn.dionysus.domain.psychtest.eval;

import com.huixinpn.dionysus.domain.psychtest.PsychTest.PsychTestType;

public class PsychTestEvaluationFactoryImpl implements PsychTestEvaluationFactory {

	public PsychTestEvaluationStrategy create(PsychTestType category) {
		switch (category) {
		case PF16:
			return new PF16EvaluationStrategy();
		case EPQ: 
			return new EPQEvaluationStrategy();
		case MMPI:
			return new MMPIEvaluationStrategy();
		case EPPS:
			return new EPPSEvaluationStrategy();
		default:
			throw new RuntimeException("unknown pschtest category");
		}
	}
}
