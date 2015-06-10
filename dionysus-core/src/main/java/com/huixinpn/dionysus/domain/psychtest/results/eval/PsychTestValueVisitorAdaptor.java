package com.huixinpn.dionysus.domain.psychtest.results.eval;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;

public class PsychTestValueVisitorAdaptor implements PsychTestValueVisitor {

	@Override
	public void accept(PsychTestQuestion question, PsychTestQuestionOption option) {
		throw new RuntimeException("not implement");
	}

	@Override
	public void accept(PsychTestQuestion question, boolean yesno) {
		throw new RuntimeException("not implement");
	}

	@Override
	public void accept(PsychTestQuestion question, String text) {
		throw new RuntimeException("not implement");
	}

}
