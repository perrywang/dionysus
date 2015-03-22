package com.huixinpn.dionysus.service.storage;

import java.io.InputStream;

public interface StorageService {
	String save(InputStream file) throws StorageException;
	String remove(String name) throws StorageException;
}
