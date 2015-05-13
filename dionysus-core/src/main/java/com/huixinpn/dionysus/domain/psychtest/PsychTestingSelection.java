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

  @OneToOne
  private PsychTestItemOption selected;

  //if some option need input text
  @Lob
  private String answer;

  @ManyToOne
  private PsychTesting testing;

}
