package org.dionysus.service;

import org.dionysus.model.Category;

public interface CategoryService {

	void save(Category category);
	
	void remove(Category category);
}
