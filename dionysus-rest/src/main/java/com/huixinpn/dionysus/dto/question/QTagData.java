package com.huixinpn.dionysus.dto.question;

import com.huixinpn.dionysus.domain.question.QTag;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QTagData extends EntityData<QTag> {

  private String name;

  public QTagData(QTag entity) {
    super(entity);
    this.name = entity.getName();
  }

  @Override
  public void update(QTag entity) {
    entity.setName(this.getName());
  }
}
