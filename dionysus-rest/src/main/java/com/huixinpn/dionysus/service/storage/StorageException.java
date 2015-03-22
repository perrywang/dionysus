package com.huixinpn.dionysus.service.storage;

@SuppressWarnings("serial")
public class StorageException extends Exception {
	
	public StorageException(String message) {
		super(message);
	}
	
	public StorageException(String message,Throwable cause){
		super(message,cause);
	}

}
