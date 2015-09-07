package com.huixinpn.dionysus.domain.psychtest.eval;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.huixinpn.dionysus.AbstractPersistentTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTest.PsychTestType;
import com.huixinpn.dionysus.domain.psychtest.PsychTestAnswer;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion.PsychTestQuestionType;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import com.huixinpn.dionysus.domain.psychtest.eval.PF16EvaluationStrategy.Answer;
import com.huixinpn.dionysus.repository.psychtest.PsychTestResultRepository;

public class PF16EvaluationStrategyTest extends AbstractPersistentTest {
  
  @Autowired
  PsychTestResultRepository repository;
  
  @Autowired
  PsychTestEvaluationFactory factory;

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

	@Test
	public void testVisitor() {
	  
    PsychTestResult result = new PsychTestResult();
    PsychTest test = new PsychTest();
    test.setType(PsychTestType.PF16);
    result.setTest(test);
    List<PsychTestAnswer> answers = new ArrayList<PsychTestAnswer>();
    PsychTestAnswer answer = new PsychTestAnswer();
    PsychTestQuestion q = new PsychTestQuestion();
    q.setType(PsychTestQuestionType.SINGLE_CHOICE);
    q.setSubId(3);
    PsychTestQuestionOption option = new PsychTestQuestionOption();
    List<PsychTestQuestionOption> options = new ArrayList<>();
    options.add(option);
    option.setIdentity("A");
    option.setQuestion(q);
    
    
    q.setOptions(options);

    answer.setQuestion(q);
    answer.setOption(option);
    
    
    
    answers.add(answer);
    
    result.setAnswers(answers);
    
    PsychTestEvaluationStrategy strategy = factory.create(result.getTest().getType());
	  
	  Object obj = strategy.evaluate(result);
	  @SuppressWarnings("unchecked")
    Map<String, Integer> score = (Map<String, Integer>) obj;
	//  Map<String, Integer> results = PF16Normalization.normalize(score, PF16Normalization.ADULT_MALE);
	  
	  Assert.assertEquals(2, score.get("A").intValue());
      Assert.assertEquals(2, score.get("normal_A").intValue());
	}
}
