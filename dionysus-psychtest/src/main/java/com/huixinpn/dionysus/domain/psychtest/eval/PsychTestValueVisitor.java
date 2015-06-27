package com.huixinpn.dionysus.domain.psychtest.eval;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;

public interface PsychTestValueVisitor {

	void accept(PsychTestQuestion question, PsychTestQuestionOption option);
	
	void accept(PsychTestQuestion question, boolean yesno);

	void accept(PsychTestQuestion question, String text);
}
