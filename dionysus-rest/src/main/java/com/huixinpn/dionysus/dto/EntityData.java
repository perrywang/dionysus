package com.huixinpn.dionysus.dto;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.utils.LinkHelper;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EntityData {
  private Long id;

  public EntityData(AbstractDionysusPersistable entity) {
    if(entity != null){
      this.id = entity.getId();
    }
  }
}
