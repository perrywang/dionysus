package com.huixinpn.dionysus.dto.user;

import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;

@Data
public class UserData extends EntityData {
  private String username;
  public UserData(User user){
    super(user);
    this.username = user.getUsername();
  }
}
