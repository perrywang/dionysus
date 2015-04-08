package com.huixinpn.dionysus.domain;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "coursefeedbacks")
public class CourseFeedback extends AbstractDionysusPersistable{

  private static final long serialVersionUID = 2523934637928638928L;

  @Lob
  private String comment;

  private Integer score;

  @ManyToOne
  private Course course;

  public CourseFeedback() {
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public Integer getScore() {
    return score;
  }

  public void setScore(Integer score) {
    this.score = score;
  }

  public Course getCourse() {
    return course;
  }

  public void setCourse(Course course) {
    this.course = course;
  }
}
