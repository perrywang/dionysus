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

  private RepositoryEntityLinks links;

  @Autowired
  public void setLinks(RepositoryEntityLinks links) {
    this.links = links;
  }

  public Link getEntityLink(AbstractDionysusPersistable entity) {
    return links.linkToSingleResource(entity.getClass(), entity.getId());
  }

  public Link getRepositoryLink(Class<?> entityKlass) {
    return links.linkToCollectionResource(entityKlass);
  }

  public Link getPagedLink(Class<?> entityKlass, Pageable pageable) {
    return links.linkToPagedResource(entityKlass, pageable);
  }
}
