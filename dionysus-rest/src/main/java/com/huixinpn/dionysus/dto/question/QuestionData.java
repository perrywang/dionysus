package com.huixinpn.dionysus.dto.question;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huixinpn.dionysus.domain.question.QTag;
import com.huixinpn.dionysus.domain.question.Question;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.user.UserData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joda.time.DateTime;

import java.util.Collection;

@Data
@NoArgsConstructor
public class QuestionData extends EntityData<Question> {

  private String title;

  private String description;

  private UserData author;

  private DateTime createdDate;

  private int numberOfAnswers;

  private Collection<QTag> tags;

  private String tagsInput;

  @JsonIgnore
  private boolean approved;

  public QuestionData(Question entity) {
    super(entity);
    this.author = new UserData(entity.getCreatedBy());
    this.title = entity.getTitle();
    this.description = entity.getDescription();
    this.createdDate = entity.getCreatedDate();
    this.tags = entity.getTags();
    this.numberOfAnswers = entity.getAnswers().size();
  }

  @Override
  public void update(Question entity) {
    entity.setTitle(this.getTitle());
    entity.setDescription(this.getDescription());
    entity.setApproved(this.isApproved());
    entity.setTags(this.getTags());
  }
}
