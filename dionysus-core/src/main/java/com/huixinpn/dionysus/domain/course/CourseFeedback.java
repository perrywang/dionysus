package com.huixinpn.dionysus.domain.course;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.jpa.domain.AbstractAuditable;

@Data
@NoArgsConstructor
@Entity
@Table(name = "coursefeedbacks")
public class CourseFeedback extends AbstractDionysusAuditable<User> {

  private static final long serialVersionUID = 2523934637928638928L;

  @Lob
  private String comment;

  private Integer score;

  @ManyToOne
  private Course course;

  public CourseFeedback(Long id) {
    super(id);
  }
}
