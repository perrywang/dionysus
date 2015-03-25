package com.huixinpn.dionysus.domain.proj;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.Article;

@Projection(name = "summary", types = Article.class)
public interface ArticleSummary {

	public Long getId();

	public String getTitle();

	public String getSummary();
}
