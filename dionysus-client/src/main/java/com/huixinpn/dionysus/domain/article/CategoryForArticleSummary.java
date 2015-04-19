package com.huixinpn.dionysus.domain.article;

import org.springframework.data.rest.core.config.Projection;

@Projection(name = "summaryWithCategory", types = Category.class)
public interface CategoryForArticleSummary {
	public Long getId();

	public String getName();
}