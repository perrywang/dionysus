package org.dionysus.service;

import java.util.List;

import org.dionysus.model.Category;

public interface CategoryService {

	Category save(Category category);

	Category find(Long id);

	List<Category> findAll();

	void remove(Category category);

}
