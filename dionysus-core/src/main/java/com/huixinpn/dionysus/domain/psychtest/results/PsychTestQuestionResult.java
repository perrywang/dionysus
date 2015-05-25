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

	@Lob
	private String answer;
}
