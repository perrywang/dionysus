package com.huixinpn.dionysus.exception.dto;

public class TransformException extends RuntimeException {

  public TransformException(String message, Throwable cause) {
    super(message, cause);
  }

  public TransformException(Throwable cause) {
    super(cause);
  }

  public TransformException(String message) {
    super(message);
  }
}
