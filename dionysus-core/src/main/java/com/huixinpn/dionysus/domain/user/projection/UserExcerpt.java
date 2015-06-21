package com.huixinpn.dionysus.domain.user.projection;

import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.rest.core.config.Projection;

/**
 * Created by huanghao on 5/26/15.
 */
@Projection(name = "excerpt", types = User.class)
public interface UserExcerpt {
    String getUsername();
    String getEmail();
    String getLandline();
    String getQq();
    String getQqAddress();
    String getAbout();
    String getRealName();
    String getAvatar();
    String getMobile();
}
