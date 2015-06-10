package com.huixinpn.dionysus.domain.psychtest.results;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.NoArgsConstructor;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion.PsychTestQuestionType;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;
import com.huixinpn.dionysus.domain.psychtest.results.eval.PsychTestValueVisitor;

@Data
@NoArgsConstructor
@Embeddable
public class PsychTestQuestionResult {

	@ManyToOne
	private PsychTestQuestion question;

	@ManyToOne
	private PsychTestQuestionOption option;

	@Column(name = "score")
	private double score;

	@Column(name = "yesno")
	private boolean yesno;

	// 16pf will normalize score
	// difference testee may have different result
	// by default it should be same as 'score'
	private double normalizedScore;

	@Lob
	private String answer;
	
	public void accept(PsychTestValueVisitor visitor) {
		PsychTestQuestionType type = question.getType();
		switch(type) {
		case SINGLE_CHOICE :
			visitor.accept(question, option);
			break;
		case YES_NO:
			visitor.accept(question, yesno);
			break;
		case GAPFILL:
			visitor.accept(question, answer);
			break;
		default:
			throw new RuntimeException("doesn't support question type: " + type);
		}
	}
}
