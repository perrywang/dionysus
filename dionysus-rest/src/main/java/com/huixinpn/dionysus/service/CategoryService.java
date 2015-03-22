package com.huixinpn.dionysus.service;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.repository.CategoryRepository;

@RepositoryRestResource(collectionResourceRel = "categories", path = "categories")
public interface CategoryService extends CategoryRepository {

}
