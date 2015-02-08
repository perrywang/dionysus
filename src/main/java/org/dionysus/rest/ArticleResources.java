package org.dionysus.rest;

import java.util.List;

import org.dionysus.model.Article;
import org.dionysus.repositories.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/articles")
public class ArticleResources {
	
	@Autowired
	private ArticleRepository service;

	@RequestMapping(method= RequestMethod.GET)
	public List<Article> getArticle() {
		return service.findAll();
	}
}
