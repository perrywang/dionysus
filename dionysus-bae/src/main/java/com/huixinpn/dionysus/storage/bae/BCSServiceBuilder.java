package com.huixinpn.dionysus.storage.bae;


public class BCSServiceBuilder {

  private String accessKey;
  private String secretKey;
  private String endPoint;
  private String bucket;

  public String getAccessKey() {
    return accessKey;
  }

  public String getSecretKey() {
    return secretKey;
  }

  public String getEndPoint() {
    return endPoint;
  }

  public String getBucket() {
    return bucket;
  }

  public BCSServiceBuilder accessKey(String accessKey) {
    this.accessKey = accessKey;
    return this;
  }

  public BCSServiceBuilder secretKey(String secretKey) {
    this.secretKey = secretKey;
    return this;
  }

  public BCSServiceBuilder endPoint(String baiduEndpoint) {
    this.endPoint = baiduEndpoint;
    return this;
  }

  public BCSServiceBuilder bucket(String bucket) {
    this.bucket = bucket;
    return this;
  }

  public BCSService build() {
    return new BCSService(this);
  }
}
