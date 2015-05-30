package com.huixinpn.dionysus.domain.article.projection;

import com.huixinpn.dionysus.domain.article.ArticleType;
import com.huixinpn.dionysus.domain.article.Blog;
import org.springframework.data.rest.core.config.Projection;

import java.util.Collection;

/**
 * Created by huanghao on 5/30/15.
 */
@Projection(name = "excerpt", types = Blog.class)
public interface BlogExcerpt {
    String getTitle();
    String getSummary();
    String getBody();
    CategoryExcerpt getCategory();
    String getCover();
    Collection<CommentExcerpt> getComments();
}
