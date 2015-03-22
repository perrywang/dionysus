package com.huixinpn.dionysus.service;

import java.io.InputStream;

/**
 * Return unique name if attachment saved (cloud/database). 
 * The name could be url or unique database PK or some else.
 * could use this "name" to get or delete attachment
 * 
 * TODO: publish as restful service
 */
public interface AttachmentService {
	String store(InputStream stream);
	String get(String name);
	String delete(String name);
}
