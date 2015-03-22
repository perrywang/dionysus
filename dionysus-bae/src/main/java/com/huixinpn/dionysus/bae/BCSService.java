package com.huixinpn.dionysus.bae;

import java.io.File;
import java.io.InputStream;

import com.baidu.inf.iis.bcs.BaiduBCS;
import com.baidu.inf.iis.bcs.auth.BCSCredentials;
import com.baidu.inf.iis.bcs.http.HttpMethodName;
import com.baidu.inf.iis.bcs.request.GenerateUrlRequest;
import com.huixinpn.dionysus.service.storage.StorageException;
import com.huixinpn.dionysus.service.storage.StorageService;

public class BCSService implements StorageService {

	private static final String PREFIX = "/";

	private BaiduBCS bcs;
	private String imageBucket;
	private String videoBucket;
	private String fileBucket;

	public BCSService(BCSServiceBuilder builder) {
		this.imageBucket = builder.getImageBucket();
		this.videoBucket = builder.getVideoBucket();
		this.fileBucket = builder.getFileBucket();
		BCSCredentials credential = new BCSCredentials(builder.getAccessKey(), builder.getSecretKey());
		bcs = new BaiduBCS(credential, builder.getBaiduEndpoint());
		bcs.setDefaultEncoding("UTF-8");
	}

	public String storeImage(File file) throws StorageException {
		return store(imageBucket, file);
	}

	public void deleteImage(String fileName) throws StorageException {
		delete(imageBucket, fileName);
	}

	public String storeVideo(File file) throws StorageException {
		return store(videoBucket, file);
	}

	public void deleteVideo(String videoName) throws StorageException {
		delete(imageBucket, videoName);
	}

	public String storeFile(File file) throws StorageException {
		return store(fileBucket, file);
	}

	public void deleteFile(String fileName) throws StorageException {
		delete(fileBucket, fileName);
	}

	private String store(String bucket, File file) throws StorageException {
		String name = PREFIX + file.getName();
		try {
			bcs.putObject(bucket, name, file);
		} catch (Exception t) {
			throw new StorageException("failed to store file (" + file.getName() + ")", t);
		}
		GenerateUrlRequest urlRuest = new GenerateUrlRequest(HttpMethodName.GET, bucket, name);
		return bcs.generateUrl(urlRuest);
	}

	private void delete(String bucket, String fileName) throws StorageException {
		String name = PREFIX + fileName;
		try {
			bcs.deleteObject(bucket, name);
		} catch (Exception t) {
			throw new StorageException("failed to delete file (" + fileName + ")", t);
		}
	}

	@Override
	public String save(InputStream file) throws StorageException {
		// TODO Auto-generated method stub
		throw new StorageException("not implements yet");
	}

	@Override
	public String remove(String name) throws StorageException {
		// TODO Auto-generated method stub
		throw new StorageException("not implements yet");
	}
}
