package com.huixinpn.dionysus.domain.article;

import org.springframework.data.rest.core.config.Projection;

@Projection(name = "summaryWithCategory", types = Article.class)
public interface ArticleSummaryWithCategory {
	public Long getId();

	public String getTitle();

	public String getSummary();

	public Category getCategory();
}