package com.huixinpn.dionysus.domain.psychtest.results.eval;

import org.junit.Assert;
import org.junit.Test;

import com.huixinpn.dionysus.domain.psychtest.results.eval.PF16EvaluationStrategy.Answer;

public class PF16EvaluationStrategyTest {

	@Test
	public void testAnswerInitialzation() {
		PF16EvaluationStrategy strategy = new PF16EvaluationStrategy();
		
		Answer a = strategy.requestAnswer(3);

		Assert.assertEquals(a.getFactor(), "A");
		Assert.assertEquals(a.getValues(), "ab");
		Assert.assertEquals(a.calculateScore("a"), 2);
		Assert.assertEquals(a.calculateScore("A"), 2);
		Assert.assertEquals(a.calculateScore("c"), 0);
		Assert.assertEquals(a.calculateScore("b"), 1);
		
		Answer b = strategy.requestAnswer(177);
		Assert.assertEquals(b.getFactor(), "B");
		Assert.assertEquals(b.getValues(), "a");
		Assert.assertEquals(b.calculateScore("a"), 1);
		Assert.assertEquals(b.calculateScore("b"), 0);
		Assert.assertEquals(b.calculateScore("c"), 0);
		
		Answer f = strategy.requestAnswer(1);
		Assert.assertEquals(f.calculateScore("a"), 0);
		
		Answer z = strategy.requestAnswer(999);
		Assert.assertEquals(z.calculateScore("a"), 0);

		Assert.assertEquals(a.calculateScore("z"), 0);
		Assert.assertEquals(b.calculateScore("x"), 0);
	}

}
