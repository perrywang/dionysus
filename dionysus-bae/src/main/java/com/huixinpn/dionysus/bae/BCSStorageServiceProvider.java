package com.huixinpn.dionysus.bae;

import java.io.File;
import java.io.InputStream;

import org.springframework.stereotype.Component;

import com.huixinpn.dionysus.service.storage.StorageException;
import com.huixinpn.dionysus.service.storage.StorageService;

@Component
public class BCSStorageServiceProvider implements StorageService {

	@Override
	public String save(File file) throws StorageException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String save(InputStream file) throws StorageException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String remove(String name) throws StorageException {
		// TODO Auto-generated method stub
		return null;
	}

}
