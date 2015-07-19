package com.huixinpn.dionysus.domain.user.projection;

import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.rest.core.config.Projection;

/**
 * Created by huanghao on 7/19/15.
 */
@Projection(name="summary", types=User.class)
public interface UserSummary {
    String getUsername();
    Long getId();
}
