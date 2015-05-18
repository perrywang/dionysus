package com.huixinpn.dionysus.service;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.repository.site.MenuRepository;

@RepositoryRestResource(collectionResourceRel = "menus", path = "menus")
public interface MenuService extends MenuRepository {

}
