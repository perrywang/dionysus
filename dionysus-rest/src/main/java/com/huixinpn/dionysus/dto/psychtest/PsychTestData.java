package com.huixinpn.dionysus.dto.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PsychTestData extends EntityData {

  private String title;
  private String description;

  public PsychTestData(PsychTest test) {
    super(test);
    this.title = test.getTitle();
    this.description = test.getDescription();
  }

}
