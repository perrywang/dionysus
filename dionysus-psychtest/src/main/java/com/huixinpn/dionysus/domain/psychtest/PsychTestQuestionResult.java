package com.huixinpn.dionysus.domain.psychtest;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion.PsychTestQuestionType;
import com.huixinpn.dionysus.domain.psychtest.eval.PsychTestValueVisitor;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Embeddable
public class PsychTestQuestionResult {

	@ManyToOne
	private PsychTestQuestion question;

	@ManyToOne
	private PsychTestQuestionOption option;

	@Column(name = "score")
	private Double score = 0.0;

	@Column(name = "yesno")
	private Boolean yesno;

	@Lob
	private String answer;

	public void accept(PsychTestValueVisitor visitor) {
		PsychTestQuestionType type = question.getType();
		switch (type) {
		case SINGLE_CHOICE:
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
