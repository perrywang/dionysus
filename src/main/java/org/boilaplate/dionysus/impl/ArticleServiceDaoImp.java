package org.boilaplate.dionysus.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.boilaplate.dionysus.ArticleDao;
import org.boilaplate.dionysus.entities.Article;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class ArticleServiceDaoImp implements ArticleDao {

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
