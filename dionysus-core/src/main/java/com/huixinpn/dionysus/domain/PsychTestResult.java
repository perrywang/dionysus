package com.huixinpn.dionysus.domain;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "testresults")
public class PsychTestResult extends AbstractDionysusAuditable<User>{

  private static final long serialVersionUID = -4860166336073876229L;

  @ManyToOne
  private PsychTest test;

  //serialized json format {itemid:optionid,...}
  @Lob
  String result;

  @Enumerated(EnumType.STRING)
  private PsychTestingState state;

}
