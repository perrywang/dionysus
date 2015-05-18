package com.huixinpn.dionysus.dto.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestItemOption;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PsychTestItemOptionData extends EntityData {

  private String description;

  public PsychTestItemOptionData(PsychTestItemOption option) {
    super(option);
    this.description = option.getDescription();
  }

}
