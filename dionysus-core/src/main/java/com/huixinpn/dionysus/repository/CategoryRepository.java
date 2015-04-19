package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.article.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
	Category findByname(String name);
}
