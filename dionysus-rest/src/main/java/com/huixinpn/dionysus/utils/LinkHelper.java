package com.huixinpn.dionysus.utils;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.rest.webmvc.support.RepositoryEntityLinks;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Service;

//used for sometime you need programmatically get entity instance link
@Service
public class LinkHelper {

  @Autowired
  private RepositoryEntityLinks links;

  private static LinkHelper instance = new LinkHelper();

  public Link getEntityLink(AbstractDionysusPersistable entity) {
    return links.linkFor(entity.getClass()).slash(entity.getId()).withSelfRel();
  }

  public Link getRepositoryLink(Class<?> entityKlass) {
    return links.linkToCollectionResource(entityKlass);
  }

  public Link getPagedLink(Class<?> entityKlass, Pageable pageable) {
    return links.linkToPagedResource(entityKlass, pageable);
  }

  public static LinkHelper instance() {
    if(instance.links == null){
      AutowireInjector.inject(instance, instance.links);
    }
    return instance;
  }
}
