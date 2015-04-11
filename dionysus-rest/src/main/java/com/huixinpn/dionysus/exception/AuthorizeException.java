package com.huixinpn.dionysus.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.UNAUTHORIZED)
public class AuthorizeException extends RuntimeException {

  private static final long serialVersionUID = 7581671080304362261L;


  public AuthorizeException(String message, Throwable cause) {
    super(message, cause);
  }

  public AuthorizeException(Throwable cause) {
    super(cause);
  }

  public AuthorizeException(String message) {
    super(message);
  }


}
