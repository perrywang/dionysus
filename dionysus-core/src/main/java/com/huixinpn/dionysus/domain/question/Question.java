package com.huixinpn.dionysus.domain.question;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name = "questions")
@Data
@NoArgsConstructor
public class Question extends AbstractDionysusAuditable<User> {

  private String title;

  private String description;

  private boolean approved = false;

  @OneToMany(mappedBy = "question")
  private Collection<QAnswer> answers = new ArrayList<>();

  @ManyToMany
  private Collection<QTag> tags = new ArrayList<>();

  private Category category;

  public Question(Long id){
    super(id);
  }
}
