package com.huixinpn.dionysus.dto.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.dto.EntityCollectionData;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Data
@NoArgsConstructor
public class PsychTestItemData extends EntityData {

  private String description;

  private Collection<PsychTestItemOptionData> options;

  private Long selected;

  public PsychTestItemData(PsychTestQuestion item) {
    super(item);
    this.description = item.getDescription();
    this.options = new EntityCollectionData<>(item.getOptions(), PsychTestItemOptionData.class).toDTOCollection();
  }
}
