package com.huixinpn.dionysus.domain.psychtest;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Data
@NoArgsConstructor
@Entity
@Table(name = "psychtestingselections")
public class PsychTestingSelection extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -4860166636073876229L;

  //when tester modify the answer we need be able to quickly find which item he is modifying
  //no need to iterate all the answered items to find.
  @OneToOne
  private PsychTestQuestion item;

  @OneToOne
  private PsychTestQuestionOption selected;

  //if some option need input text
  @Lob
  private String answer;

  @ManyToOne
  private PsychTesting testing;

}
