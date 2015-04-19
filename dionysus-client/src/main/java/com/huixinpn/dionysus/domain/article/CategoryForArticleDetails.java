package com.huixinpn.dionysus.domain.article;

import org.springframework.data.rest.core.config.Projection;

@Projection(name = "detailsWithCategory", types = Category.class)
public interface CategoryForArticleDetails {
	public Long getId();

	public String getName();
}