package com.huixinpn.dionysus.domain.psychtest.results.eval;

import java.util.Map;

import org.junit.Assert;
import org.junit.Test;

import com.huixinpn.dionysus.domain.psychtest.results.eval.PF16EvaluationStrategy.Answer;

public class PF16EvaluationStrategyTest {

	@Test
	public void testAnswerInitialzation() {
		PF16EvaluationStrategy strategy = new PF16EvaluationStrategy();
		Map<Integer, Answer> answsers = strategy.getAnswers();
		Answer a = answsers.get(3);

		Assert.assertEquals(a.getFactor(), "A");
		Assert.assertEquals(a.getValues(), "ab");
		Assert.assertEquals(a.calculateScore("a"), 2);
		Assert.assertEquals(a.calculateScore("A"), 2);
		Assert.assertEquals(a.calculateScore("c"), 0);
		Assert.assertEquals(a.calculateScore("b"), 1);
		
		Answer b = answsers.get(177);
		Assert.assertEquals(b.getFactor(), "B");
		Assert.assertEquals(b.getValues(), "a");
		Assert.assertEquals(b.calculateScore("a"), 1);
		Assert.assertEquals(b.calculateScore("b"), 0);
		Assert.assertEquals(b.calculateScore("c"), 0);
		

		Assert.assertEquals(a.calculateScore("z"), 0);
		Assert.assertEquals(b.calculateScore("x"), 0);
	}

}
