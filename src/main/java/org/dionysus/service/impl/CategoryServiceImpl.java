package org.dionysus.service.impl;

import java.util.List;

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
	public Category save(Category category) {
		entityManager.persist(category);
		return category;
	}

	@Override
	@Transactional(readOnly = false)
	public void remove(Category category) {
		entityManager.remove(category);
	}

	@Override
	@Transactional(readOnly = true)
	public Category find(Long id) {
		return entityManager.find(Category.class, id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Category> findAll() {
		String qlString = "SELECT c FROM Category c";
		return entityManager.createQuery(qlString, Category.class)
				.getResultList();
	}
}
