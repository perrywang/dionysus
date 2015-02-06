package org.dionysus.service;

import java.util.List;

import org.dionysus.model.Article;

public interface ArticleService {
	public List<Article> findLatestArticle();
	
	public void save(Article article);
}