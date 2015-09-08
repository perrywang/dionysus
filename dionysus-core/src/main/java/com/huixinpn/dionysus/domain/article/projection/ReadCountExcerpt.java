package com.huixinpn.dionysus.domain.article.projection;

import com.huixinpn.dionysus.domain.article.ArticleReadCounter;
import org.springframework.data.rest.core.config.Projection;

/**
 * Created by huanghao on 9/8/15.
 */
@Projection(name="readcount", types = ArticleReadCounter.class)
public interface ReadCountExcerpt {
    Integer getValue();
}
