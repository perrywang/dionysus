package com.huixinpn.dionysus.dto.tag;

import com.huixinpn.dionysus.domain.tag.Tag;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TagData extends EntityData<Tag> {
  private String name;

  public TagData(Tag tag) {
    super(tag);
    this.name = tag.getName();
  }

  public Tag toEntity(){
    Tag tag = new Tag();
    tag.setId(this.getId());
    tag.setName(this.getName());
    return tag;
  }

  @Override
  public void update(Tag tag){
    tag.setName(this.getName());
  }

}
