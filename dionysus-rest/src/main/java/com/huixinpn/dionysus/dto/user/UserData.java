package com.huixinpn.dionysus.dto.user;

import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserData extends EntityData<User> {
  private String username;

  public UserData(User user) {
    super(user);
    this.username = user.getUsername();
  }

  @Override
  public void update(User entity) {
    entity.setUsername(this.getUsername());
  }
}
