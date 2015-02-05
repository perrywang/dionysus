package org.boilaplate.dionysus.rest;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.boilaplate.dionysus.ArticleService;
import org.boilaplate.dionysus.entities.Article;

@Path("/articles")
public class ArticleResources {
	
	@Inject
	private ArticleService dao;

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public List<Article> findLatestArticle() {
		return dao.findLatestArticle();
	}
}
