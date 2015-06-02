package com.huixinpn.dionysus.controller.util;

public class Utils {

  public static final String EMPTY_JSON_OBJECT = "{}";

  public static String wrapSaveResult(Long id){
     return "{\"id\":" + id + "}";
  }
}
