package com.huixinpn.dionysus.dto;


import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.domain.Page;

import java.util.Collection;

@Data
@NoArgsConstructor
public class EntityPageData<T extends EntityData> {
  private static int defaultPageSize = 20;
  private Collection<T> content;
  private long total;
  private int number;
  private int size;
  public EntityPageData(Page<? extends AbstractDionysusPersistable> page,Class<T> klass){
    this.total = page.getTotalElements();
    this.number = page.getNumber();
    this.size = page.getSize();
    this.content = new EntityCollectionData<T>(page.getContent(),klass).toDTOCollection();
  }

  public static int getDefaultPageSize() {
    return defaultPageSize;
  }

  public static void setDefaultPageSize(int defaultPageSize) {
    EntityPageData.defaultPageSize = defaultPageSize;
  }
}
