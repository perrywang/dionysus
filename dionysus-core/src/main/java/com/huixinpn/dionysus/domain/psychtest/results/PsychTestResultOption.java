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
public class PsychTestResultOption {

	@ManyToOne
	private PsychTestQuestion question;

	@ManyToOne
	private PsychTestQuestionOption selected;

	@Lob
	private String answer;

}
