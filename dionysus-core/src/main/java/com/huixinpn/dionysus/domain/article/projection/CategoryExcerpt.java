package com.huixinpn.dionysus.domain.article.projection;

import com.huixinpn.dionysus.domain.article.Category;
import org.springframework.data.rest.core.config.Projection;

/**
 * Created by huanghao on 5/26/15.
 */
@Projection(name = "excerpt", types = Category.class)
public interface CategoryExcerpt {
    Long getId();
    String getName();
}
