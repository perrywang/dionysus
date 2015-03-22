package com.huixinpn.dionysus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonView;
import com.huixinpn.dionysus.domain.Article;
import com.huixinpn.dionysus.repository.ArticleRepository;
import com.huixinpn.dionysus.view.View;

@Controller
class RefinedArticleController {

	@Autowired
	@Qualifier("articleRepository") ArticleRepository repository;
	
	@JsonView(View.Summary.class)
	@RequestMapping(method = RequestMethod.GET, value = "/api/v1.1/articles")
	@ResponseBody List<Article> getArticles() {
		return repository.findAll();
	}
	
	@JsonView(View.Detail.class)
	@RequestMapping(method = RequestMethod.GET, value = "/api/v1.1/articles/{id}")
	@ResponseBody Article getArticle(@PathVariable Long id) {
		return repository.findOne(id);
	}
}
