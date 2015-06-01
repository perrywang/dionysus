package com.huixinpn.dionysus.domain.article.projection;

import com.huixinpn.dionysus.domain.article.ArticleType;
import com.huixinpn.dionysus.domain.article.Blog;
import com.huixinpn.dionysus.domain.user.projection.UserExcerpt;
import org.springframework.data.rest.core.config.Projection;

import java.util.Collection;

/**
 * Created by huanghao on 5/30/15.
 */
@Projection(name = "detail", types = Blog.class)
public interface BlogDetail {
    Long getId();
    String getTitle();
    String getSummary();
    String getBody();
    UserExcerpt getCreatedBy();
    Collection<CommentExcerpt> getComments();
}
