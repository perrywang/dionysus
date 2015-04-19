package com.huixinpn.dionysus.domain.psychtest;

import org.hibernate.validator.constraints.NotBlank;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

import javax.persistence.*;

@Entity
@Table(name = "psychtestitemoptions")
public class PsychTestItemOption extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -3002875103419512957L;

  @NotBlank
  @Column(name = "description")
  private String description;

  private Integer score;

  public PsychTestItemOption(String description, int score) {
    this.score = score;
    this.description = description;
  }

  public PsychTestItemOption(String description) {
    this.description = description;
    this.score = 0;
  }

  public PsychTestItemOption() {
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Integer getScore() {
    return score;
  }

  public void setScore(Integer score) {
    this.score = score;
  }

}