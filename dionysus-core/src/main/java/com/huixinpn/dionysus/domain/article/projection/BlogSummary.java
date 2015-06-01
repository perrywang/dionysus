package com.huixinpn.dionysus.domain.article.projection;

import com.huixinpn.dionysus.domain.article.Blog;
import com.huixinpn.dionysus.domain.user.projection.UserExcerpt;
import org.springframework.data.rest.core.config.Projection;

/**
 * Created by huanghao on 5/31/15.
 */
@Projection(name = "blogsummary", types = Blog.class)
public interface BlogSummary {
    Long getId();
    String getTitle();
    String getSummary();
    UserExcerpt getCreatedBy();
}
