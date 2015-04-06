package com.huixinpn.dionysus.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.FORBIDDEN)
public class InvalidUserException extends RuntimeException {

	private static final long serialVersionUID = 7581621080304362261L;
	
	public InvalidUserException(Exception e) {
		super(e);
	}
}
