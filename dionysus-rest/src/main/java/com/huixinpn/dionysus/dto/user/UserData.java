package com.huixinpn.dionysus.dto.user;

import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joda.time.DateTime;

@Data
@NoArgsConstructor
public class UserData extends EntityData<User> {
  private String username;
  private String avatar;

  public UserData(User user) {
    super(user);
    this.username = user.getUsername();
    this.avatar = user.getAvatar();
  }

  @Override
  public void update(User entity) {
    entity.setUsername(this.getUsername());
  }
}
