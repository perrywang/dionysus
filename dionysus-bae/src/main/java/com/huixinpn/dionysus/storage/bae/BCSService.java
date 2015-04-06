package com.huixinpn.dionysus.storage.bae;

import com.baidu.inf.iis.bcs.BaiduBCS;
import com.baidu.inf.iis.bcs.auth.BCSCredentials;
import com.baidu.inf.iis.bcs.http.HttpMethodName;
import com.baidu.inf.iis.bcs.model.ObjectMetadata;
import com.baidu.inf.iis.bcs.request.GenerateUrlRequest;
import com.huixinpn.dionysus.meta.BCSMedia;
import com.huixinpn.dionysus.repository.BCSMediaRepository;
import com.huixinpn.dionysus.storage.StorageException;
import com.huixinpn.dionysus.storage.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.UUID;

@Service("bcs")
public class BCSService implements StorageService {

  private static final String PREFIX = "/";

  private BCSConfiguration configuration;

  private BCSMediaRepository repository;

  private BaiduBCS bcs;

  private String bucket;

  public BCSService() {
  }

  @PostConstruct
  private void initialize(){
    this.bucket = configuration.getBucket();
    BCSCredentials credential = new BCSCredentials(configuration.getAccessKey(),configuration.getSecretKey());
    bcs = new BaiduBCS(credential, configuration.getEndPoint());
    bcs.setDefaultEncoding("UTF-8");
  }

  public BCSService(BCSServiceBuilder builder) {
    this.bucket = builder.getBucket();
    BCSCredentials credential = new BCSCredentials(builder.getAccessKey(), builder.getSecretKey());
    bcs = new BaiduBCS(credential, builder.getEndPoint());
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
      repository.delete(repository.findByObject(object));
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


  public BCSMediaRepository getRepository() {
    return repository;
  }

  @Autowired
  public void setRepository(BCSMediaRepository repository) {
    this.repository = repository;
  }

  public BCSConfiguration getConfiguration() {
    return configuration;
  }

  @Autowired
  public void setConfiguration(BCSConfiguration configuration) {
    this.configuration = configuration;
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
      GenerateUrlRequest urlRequest = new GenerateUrlRequest(HttpMethodName.GET, bucket, normalized);
      String url = bcs.generateUrl(urlRequest);
      BCSMedia meta = new BCSMedia();
      meta.setObject(object);
      meta.setBucket(bucket);
      meta.setMimetype("application/octet-stream");
      meta.setUrl(url);
      repository.save(meta);
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
