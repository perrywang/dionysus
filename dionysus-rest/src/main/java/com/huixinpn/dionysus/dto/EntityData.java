package com.huixinpn.dionysus.dto;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.utils.LinkHelper;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EntityData {
  private Long id;
  private String href;

  public EntityData(AbstractDionysusPersistable entity) {

    this.id = entity.getId();
    this.href = LinkHelper.instance().getEntityLink(entity).getHref();
  }
}
