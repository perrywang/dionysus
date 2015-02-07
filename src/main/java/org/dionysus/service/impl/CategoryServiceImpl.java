package org.dionysus.service.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.dionysus.model.Category;
import org.dionysus.service.CategoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CategoryServiceImpl implements CategoryService {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional(readOnly = false)
	public void save(Category category) {
		entityManager.persist(category);
	}

	@Override
	@Transactional(readOnly = false)
	public void remove(Category category) {
		entityManager.remove(category);
	}
}
