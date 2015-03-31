package com.huixinpn.dionysus.domain.proj;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.Article;
import com.huixinpn.dionysus.domain.Category;

@Projection(name = "summary", types = Article.class)
public interface ArticleSummary {

	public Long getId();

	public String getTitle();

	public String getSummary();

	public Long getCategoryId();

	public Category getCategory();
}
