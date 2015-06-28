package com.huixinpn.dionysus.domain.psychtest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion.PsychTestQuestionType;
import com.huixinpn.dionysus.domain.psychtest.eval.PsychTestValueVisitor;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "psychtestanswers")
public class PsychTestAnswer extends AbstractDionysusPersistable {
  
  private static final long serialVersionUID = -8260750036066011305L;

  @ManyToOne
  private PsychTestResult result;

	@ManyToOne
	private PsychTestQuestion question;

	@ManyToOne
	private PsychTestQuestionOption option;

  @Column(name = "yesno")
  private Boolean yesno;

  @Lob
  private String answer;
	
	public Long getQid() {
	  return this.question.getId();
	}
	
	public Object getValue() {
	  PsychTestQuestionType type = this.question.getType();
	  switch(type) {
	  case SINGLE_CHOICE: 
	    return option.getId();
	  case YES_NO: 
	    return yesno;
	  case GAPFILL:
	    return answer;
	  default:
	    return null;
	  }
	}

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
