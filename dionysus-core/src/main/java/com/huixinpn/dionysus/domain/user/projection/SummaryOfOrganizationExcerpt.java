package com.huixinpn.dionysus.domain.user.projection;

import com.huixinpn.dionysus.domain.user.Organization;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "summaryOfOrganization", types = Organization.class)
public interface SummaryOfOrganizationExcerpt {
    Long getId();
    String getUsername();
    String getAbout();
    String getRealName();
    String getAvatar();
}
