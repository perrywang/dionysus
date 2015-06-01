package com.huixinpn.dionysus.domain.user.projection;

import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.rest.core.config.Projection;

/**
 * Created by huanghao on 5/26/15.
 */
@Projection(name = "excerpt", types = User.class)
public interface UserExcerpt {
    Long getId();
    String getUsername();
    String getAvatar();
}
