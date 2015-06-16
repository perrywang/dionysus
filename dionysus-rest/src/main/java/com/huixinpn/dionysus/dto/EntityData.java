package com.huixinpn.dionysus.dto;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.utils.LinkHelper;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public abstract class EntityData<T extends AbstractDionysusPersistable> {
  private Long id;

  public EntityData(T entity) {
    if(entity != null){
      this.id = entity.getId();
    }
  }

  public abstract void update(T entity);
}
