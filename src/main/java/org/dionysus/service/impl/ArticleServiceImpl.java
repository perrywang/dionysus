package org.dionysus.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.dionysus.model.Article;
import org.dionysus.service.ArticleService;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class ArticleServiceImpl implements ArticleService {

	// An entity manager can only be injected in classes running inside a transaction.
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional(readOnly=true)
	public List<Article> findLatestArticle() {
		String qlString = "SELECT a FROM Article a ORDER BY a.id desc";
		TypedQuery<Article> query = entityManager.createQuery(qlString, Article.class);		

		return query.getResultList();
	}
}
