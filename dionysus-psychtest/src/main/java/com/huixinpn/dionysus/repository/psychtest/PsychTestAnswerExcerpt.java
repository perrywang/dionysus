package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;

public interface PsychTestAnswerExcerpt {

  PsychTestQuestionOption getOption();
  
  Boolean getYesno();
  
  String getAnswer();
  
  Double getScore();
}
