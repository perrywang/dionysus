package com.huixinpn.dionysus.domain.question;

import com.huixinpn.dionysus.domain.AbstractDionysusNotifiable;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "answers")
@Data
@NoArgsConstructor
public class Answer extends AbstractDionysusNotifiable<User> {

  private static final long serialVersionUID = 2523934617928030908L;

  @ManyToOne
  private Question question;

  private String content;

  private boolean visibleAll = true;

  public Answer(Long id) {
    super(id);
  }

  @Override
  public User receiveFrom() {
    return this.getCreatedBy();
  }

  @Override
  public List<User> sendTo() {
    User creator = this.question.getCreatedBy();
    User updator = this.question.getLastModifiedBy();
    List<User> users = new ArrayList<User>();
    if (creator != null) {
      users.add(creator);
    }
    if (updator != null && updator != creator) {
      users.add(updator);
    }
    return users;
  }

  @Override
  public String getSummary() {
    return this.getContent();
  }
}


