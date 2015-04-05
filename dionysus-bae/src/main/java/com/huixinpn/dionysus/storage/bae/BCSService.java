package com.huixinpn.dionysus.storage.bae;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.UUID;

import com.baidu.inf.iis.bcs.BaiduBCS;
import com.baidu.inf.iis.bcs.auth.BCSCredentials;
import com.baidu.inf.iis.bcs.http.HttpMethodName;
import com.baidu.inf.iis.bcs.model.ObjectMetadata;
import com.baidu.inf.iis.bcs.request.GenerateUrlRequest;
import com.huixinpn.dionysus.storage.StorageException;
import com.huixinpn.dionysus.storage.StorageService;

public class BCSService implements StorageService {

  private static final String PREFIX = "/";

  private BaiduBCS bcs;

  private String bucket;

  public BCSService(BCSServiceBuilder builder) {
    this.bucket = builder.getBucket();
    BCSCredentials credential = new BCSCredentials(builder.getAccessKey(), builder.getSecretKey());
    bcs = new BaiduBCS(credential, builder.getBaiduEndpoint());
    bcs.setDefaultEncoding("UTF-8");
  }

  private String store(File file) throws StorageException {
    String object = UUID.randomUUID().toString();
    String normalized = PREFIX + object;
    try {
      bcs.putObject(bucket, normalized, file);
    } catch (Exception t) {
      throw new StorageException("failed to store file (" + file.getName() + ")", t);
    }
    return object;
  }

  private void delete(String object) throws StorageException {
    try {
      bcs.deleteObject(bucket, PREFIX+object);
    } catch (Exception t) {
      throw new StorageException("failed to delete file from baidu cloud", t);
    }
  }

  public String url(String object){
    GenerateUrlRequest urlRequest = new GenerateUrlRequest(HttpMethodName.GET, bucket, PREFIX + object);
    return bcs.generateUrl(urlRequest);
  }

  public String getBucket(){
    return this.bucket;
  }

  @Override
  public String save(InputStream input) throws StorageException {
    try {
      int length = input.available();
      String object = UUID.randomUUID().toString();
      String normalized = PREFIX + object;
      ObjectMetadata metadata = new ObjectMetadata();
      metadata.setContentLength(length);
      metadata.setContentType("application/octet-stream");
      bcs.putObject(bucket, normalized, input, metadata);
      return object;
    } catch (Exception e) {
      throw new StorageException("store to baidu cloud failed", e);
    }
  }

  @Override
  public void remove(String name) throws StorageException {
    delete(name);
  }

  @Override
  public String save(byte[] data) throws StorageException {
    InputStream stream = new ByteArrayInputStream(data);
    return save(stream);
  }
}
