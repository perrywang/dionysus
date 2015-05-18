package com.huixinpn.dionysus.dto.psychtest;

import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;

@Data
public class PsychTestingSelectionData extends EntityData {
  private Long option_id;
  private String answer;
}
