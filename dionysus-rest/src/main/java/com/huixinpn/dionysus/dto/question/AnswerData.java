package com.huixinpn.dionysus.dto.question;

import com.huixinpn.dionysus.domain.question.Answer;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.user.UserData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joda.time.DateTime;

@Data
@NoArgsConstructor
public class AnswerData extends EntityData<Answer> {

  private UserData createdBy;

  private String content;

  private DateTime createdDate;


  public AnswerData(Answer entity) {
    super(entity);
    this.createdBy = new UserData(entity.getCreatedBy());
    this.content = entity.getContent();
    this.createdDate = entity.getCreatedDate();
  }

  @Override
  public void update(Answer entity) {
    entity.setContent(this.content);
  }
}
