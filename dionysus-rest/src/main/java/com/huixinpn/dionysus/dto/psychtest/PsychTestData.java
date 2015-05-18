package com.huixinpn.dionysus.dto.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestItem;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
public class PsychTestData extends EntityData {

  private String title;
  private String description;
  private Collection<Long> items = new ArrayList<>();

  public PsychTestData(PsychTest test) {
    super(test);
    this.title = test.getTitle();
    this.description = test.getDescription();
    for(PsychTestItem item : test.getItems()){
      items.add(item.getId());
    }
  }

}
