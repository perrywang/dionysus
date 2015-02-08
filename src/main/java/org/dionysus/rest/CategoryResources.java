package org.dionysus.rest;

import java.util.List;

import org.dionysus.model.Category;
import org.dionysus.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/categories")
public class CategoryResources {

	@Autowired
	CategoryRepository repository;

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Category create(@RequestBody Category category) {
		return repository.save(category);
	}

	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody List<Category> getAll() {
		return repository.findAll();
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public @ResponseBody Category find(@PathVariable Long id) {
		return repository.getOne(id);
	}
}
