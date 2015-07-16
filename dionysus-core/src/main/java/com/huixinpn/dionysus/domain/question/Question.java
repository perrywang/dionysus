package com.huixinpn.dionysus.domain.question;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name = "questions")
@Data
@NoArgsConstructor
public class Question extends AbstractDionysusAuditable<User> {

  private static final long serialVersionUID = 2523934617928638908L;

  private String title;

  private String description;

  private boolean approved = true;

  @OneToMany(mappedBy = "question",cascade = {CascadeType.REMOVE})
  private Collection<Answer> answers = new ArrayList<>();

  @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
  private Collection<QTag> tags = new ArrayList<>();

  private Category category;

  public Question(Long id) {
    super(id);
  }
}
