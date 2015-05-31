package com.huixinpn.dionysus.domain.psychtest.results.eval;

import java.util.Collection;

import com.huixinpn.dionysus.domain.psychtest.results.PsychTestEvaluationStrategy;
import com.huixinpn.dionysus.domain.psychtest.results.PsychTestQuestionResult;
import com.huixinpn.dionysus.domain.psychtest.results.PsychTestResult;

public class PF16EvaluationStrategoy implements PsychTestEvaluationStrategy {

	@Override
	public void evaluate(PsychTestResult result) {

		Collection<PsychTestQuestionResult> answers = result.getAnswers();
		for (PsychTestQuestionResult answer : answers) {
			// TODO: 十六种个性因素常模
			answer.setNormalizedScore(answer.getScore());
		}
	}

}
