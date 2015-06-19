package com.huixinpn.dionysus.domain.user.projection;

import com.huixinpn.dionysus.domain.user.ConsExpertise;
import com.huixinpn.dionysus.domain.user.Consultant;
import org.springframework.data.rest.core.config.Projection;

import java.util.Collection;

/**
 * Created by huanghao on 6/19/15.
 */
@Projection(name="expertise", types= Consultant.class)
public interface ConsultantExpertise {
    Long getId();
    String getUsername();
    String getEmail();
    String getLandline();
    String getQq();
    String getQqAddress();
    String getAbout();
    String getRealName();
    String getAvatar();
    String getMobile();
    Collection<ConsExpertise> getExpertises();
}
