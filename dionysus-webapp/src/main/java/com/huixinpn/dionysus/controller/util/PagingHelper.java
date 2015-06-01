package com.huixinpn.dionysus.controller.util;

import lombok.Data;
import org.springframework.data.domain.PageRequest;

@Data
public class PagingHelper {
  private static Integer defaultPageSize = 20;

  public static PageRequest getPageRequest(Integer page, Integer size) {
    int pageNumber = (page == null ? 0 : page);
    int pageSize = (size == null ? defaultPageSize : size);
    defaultPageSize = pageSize;
    return new PageRequest(pageNumber, pageSize);
  }
}
