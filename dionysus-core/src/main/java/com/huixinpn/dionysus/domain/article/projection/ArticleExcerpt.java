package com.huixinpn.dionysus.domain.article.projection;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.ArticleType;
import org.springframework.data.rest.core.config.Projection;

import java.util.Collection;

/**
 * Created by huanghao on 5/25/15.
 */
@Projection(name = "excerpt", types = Article.class)
public interface ArticleExcerpt {
    Long getId();
    String getTitle();
    String getSummary();
    String getBody();
    CategoryExcerpt getCategory();
    String getCover();
    ArticleType getType();
    Boolean getInterview();
    Collection<CommentExcerpt> getComments();
}
