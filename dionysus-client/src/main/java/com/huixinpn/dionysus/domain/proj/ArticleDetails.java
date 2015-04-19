package com.huixinpn.dionysus.domain.proj;

import org.springframework.data.rest.core.config.Projection;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Category;

@Projection(name = "detail", types = Article.class)
public interface ArticleDetails {

	public Long getId();

	public String getTitle();

	public String getSummary();

	public String getBody();
	
	public Category getCategory();
	
}
