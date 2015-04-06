package com.huixinpn.dionysus.storage;

import java.io.InputStream;

public interface StorageService {
	String save(InputStream file) throws StorageException;

	void remove(String name) throws StorageException;

	String save(byte[] data) throws StorageException;
	
	String url(String id) throws StorageException;
}
