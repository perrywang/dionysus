package com.huixinpn.dionysus.domain.article.projection;

import com.huixinpn.dionysus.domain.article.ArticleType;
import com.huixinpn.dionysus.domain.article.OfficialArticle;
import org.springframework.data.rest.core.config.Projection;

import java.util.Collection;

/**
 * Created by huanghao on 5/30/15.
 */
@Projection(name = "excerpt", types = OfficialArticle.class)
public interface OfficialArticleExcerpt {
    Long getId();
    String getTitle();
    String getSummary();
    String getBody();
    CategoryExcerpt getCategory();
    String getCover();
    ArticleType getType();
    Boolean getInterview();
    Collection<CommentExcerpt> getComments();
    String getLocation();
}
