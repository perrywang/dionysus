package com.huixinpn.dionysus.storage.bae;

import com.baidubce.auth.BceCredentials;
import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.bos.BosClient;
import com.baidubce.services.bos.BosClientConfiguration;
import com.baidubce.services.bos.model.GeneratePresignedUrlRequest;
import com.baidubce.services.bos.model.ObjectMetadata;
import com.huixinpn.dionysus.meta.BOSMedia;
import com.huixinpn.dionysus.repository.BOSMediaRepository;
import com.huixinpn.dionysus.storage.StorageException;
import com.huixinpn.dionysus.storage.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

@Service("bcs")
public class BOSService implements StorageService {

  private static final String binaryContentType = "application/octet-stream";

  private BOSConfiguration configuration;

  private BOSMediaRepository repository;

  private BosClient bos;

  private String bucket;

  public BOSService() {
  }

  @PostConstruct
  private void initialize() {
    this.bucket = configuration.getBucket();
    BosClientConfiguration config = new BosClientConfiguration();
    config.setCredentials(new DefaultBceCredentials(configuration.getAccessKey(), configuration.getSecretKey()));
    config.setEndpoint(configuration.getEndPoint());
    bos = new BosClient(config);
  }

  public BOSService(BOSServiceBuilder builder) {
    this.bucket = builder.getBucket();
    BosClientConfiguration config = new BosClientConfiguration();
    BceCredentials credential = new DefaultBceCredentials(builder.getAccessKey(),
        builder.getSecretKey());
    config.setCredentials(credential);
    config.setEndpoint(builder.getEndPoint());
    bos = new BosClient(config);
  }

  private void delete(String object) throws StorageException {
    try {
      bos.deleteObject(bucket, object);
      repository.delete(repository.findByObject(object));
    } catch (Exception t) {
      throw new StorageException(
          "failed to delete file from baidu cloud", t);
    }
  }

  public String url(String object) {
    GeneratePresignedUrlRequest urlRequest = new GeneratePresignedUrlRequest(this.bucket, object);
    return bos.generatePresignedUrl(urlRequest).toString();
  }

  public String getBucket() {
    return this.bucket;
  }

  public BOSMediaRepository getRepository() {
    return repository;
  }

  @Autowired
  public void setRepository(BOSMediaRepository repository) {
    this.repository = repository;
  }

  public BOSConfiguration getConfiguration() {
    return configuration;
  }

  @Autowired
  public void setConfiguration(BOSConfiguration configuration) {
    this.configuration = configuration;
  }

  @Override
  public String save(InputStream input) throws StorageException {
    try {
      int length = input.available();
      String object = UUID.randomUUID().toString();
      ObjectMetadata metadata = new ObjectMetadata();
      metadata.setContentLength(length);
      metadata.setContentType(binaryContentType);
      bos.putObject(bucket, object, input, metadata);
      String url = this.url(object);
      BOSMedia meta = new BOSMedia();
      meta.setObject(object);
      meta.setBucket(bucket);
      meta.setMimetype(binaryContentType);
      meta.setUrl(url);
      meta.setSize(length);
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
