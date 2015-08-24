package com.huixinpn.dionysus.domain.psychtest.eval;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;

public class STSEvaluationStrategy implements PsychTestEvaluationStrategy {
	class STSVisitor extends PsychTestValueVisitorAdaptor {
		private int score = 0;

		@Override
		public void accept(PsychTestQuestion question, PsychTestQuestionOption option) {
			String identity = option.getIdentity();
			int value;
			switch(identity){
				case "A":
					value = 1;
					break;
				case "B":
					value = 2;
					break;
				case "C":
					value = 3;
					break;
				case "D":
					value = 4;
					break;
				default: 
					value = 0;
					break;
			}
			this.score += value;
		}

		public int getScore() {
			return this.score;
		}
	}

  @Override
  public Object evaluate(PsychTestResult result) {
	  STSVisitor visitor = new STSVisitor();
	  result.accept(visitor);
	  return visitor.getScore();
  }

}