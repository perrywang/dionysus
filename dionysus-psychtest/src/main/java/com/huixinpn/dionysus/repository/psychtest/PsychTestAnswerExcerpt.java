package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion.PsychTestQuestionType;

public interface PsychTestAnswerExcerpt {

  Long getId();

  Long getQid();

  PsychTestQuestionType getType();

  Object getValue();
}
