package com.huixinpn.dionysus.domain.user.projection;

import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "summaryOfOrganization", types = User.class)
public interface SummaryOfOrganizationExcerpt {
    Long getId();

    String getRealName();

    String getAvatar();
}
