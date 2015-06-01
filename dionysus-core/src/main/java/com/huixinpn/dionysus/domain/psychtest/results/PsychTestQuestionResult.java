package com.huixinpn.dionysus.domain.psychtest.results;

import javax.persistence.Embeddable;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.NoArgsConstructor;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;

@Data
@NoArgsConstructor
@Embeddable
public class PsychTestQuestionResult {

	@ManyToOne
	private PsychTestQuestion question;

	// XXX: how about multiple-choice ?
	@ManyToOne
	private PsychTestQuestionOption option;
	
	// raw value
	private double score;
	
	// 16pf will normalize score
	// difference testee may have different result
	// by default it should be same as 'score'
	private double normalizedScore;

	@Lob
	private String answer;
}
