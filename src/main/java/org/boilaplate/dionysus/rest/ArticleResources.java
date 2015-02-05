package org.boilaplate.dionysus.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.boilaplate.dionysus.ArticleDao;
import org.boilaplate.dionysus.entities.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Path("/articles")
public class ArticleResources {
	
	@Autowired
	private ArticleDao dao;

	@GET
	@Produces({ MediaType.APPLICATION_XML })
	public List<Article> findLatestArticle() {
		return dao.findLatestArticle();
	}
}
