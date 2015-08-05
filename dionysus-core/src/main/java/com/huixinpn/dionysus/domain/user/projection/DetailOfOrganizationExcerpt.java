package com.huixinpn.dionysus.domain.user.projection;

import com.huixinpn.dionysus.domain.user.Organization;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "detailOfOrganization", types = Organization.class)
public interface DetailOfOrganizationExcerpt {
    String getUsername();
    String getEmail();
    String getAbout();
    String getRealName();
    String getAvatar();
    String getLocation();
}
