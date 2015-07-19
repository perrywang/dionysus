package com.huixinpn.dionysus.domain.user.projection;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.user.Notification;
import org.joda.time.DateTime;
import org.springframework.data.rest.core.config.Projection;

/**
 * Created by huanghao on 7/19/15.
 */

@Projection(name="excerpt", types= Notification.class)
public interface NotificationExcerpt {
    UserSummary getFrom();
    String getSummary();

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    public DateTime getLastModifiedDate();
}
