package com.huixinpn.dionysus.storage.bae;


public class BCSServiceBuilder {

	private String accessKey;
	private String secretKey;
	private String baiduEndpoint;

	private String imageBucket;
	private String videoBucket;
	private String fileBucket;

	public String getAccessKey() {
		return accessKey;
	}

	public String getSecretKey() {
		return secretKey;
	}

	public String getBaiduEndpoint() {
		return baiduEndpoint;
	}

	public String getImageBucket() {
		return imageBucket;
	}

	public String getVideoBucket() {
		return videoBucket;
	}

	public String getFileBucket() {
		return fileBucket;
	}

	public BCSServiceBuilder accessKey(String accessKey) {
		this.accessKey = accessKey;
		return this;
	}

	public BCSServiceBuilder secretKey(String secretKey) {
		this.secretKey = secretKey;
		return this;
	}

	public BCSServiceBuilder baiduEndpoint(String baiduEndpoint) {
		this.baiduEndpoint = baiduEndpoint;
		return this;
	}

	public BCSServiceBuilder imageBucket(String imageBucket) {
		this.imageBucket = imageBucket;
		return this;
	}

	public BCSServiceBuilder videoBucket(String videoBucket) {
		this.videoBucket = videoBucket;
		return this;
	}

	public BCSServiceBuilder fileBucket(String fileBucket) {
		this.fileBucket = fileBucket;
		return this;
	}

	public BCSService build() {
		return new BCSService(this);
	}
}
