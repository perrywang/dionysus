package com.huixinpn.dionysus.domain.article.projection;

import com.huixinpn.dionysus.domain.article.ArticleType;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.article.Comment;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.domain.user.projection.UserExcerpt;
import org.joda.time.DateTime;
import org.springframework.data.rest.core.config.Projection;

import java.util.Collection;

/**
 * Created by huanghao on 5/25/15.
 */
@Projection(name = "excerpt", types = {Comment.class})
public interface CommentExcerpt {

    Long getId();
    String getContent();
    UserExcerpt getCreatedBy();
    DateTime getLastModifiedDate();

}
