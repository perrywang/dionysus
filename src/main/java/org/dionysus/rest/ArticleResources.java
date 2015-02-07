package org.dionysus.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.dionysus.model.Article;
import org.dionysus.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Path("/articles")
public class ArticleResources {
	
	@Autowired
	private ArticleService service;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Article> getArticle() {
		return service.findLatestArticle();
	}
}
