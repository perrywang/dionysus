package com.huixinpn.dionysus.storage.bae;

public class BOSServiceBuilder {

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

	public BOSServiceBuilder accessKey(String accessKey) {
		this.accessKey = accessKey;
		return this;
	}

	public BOSServiceBuilder secretKey(String secretKey) {
		this.secretKey = secretKey;
		return this;
	}

	public BOSServiceBuilder endPoint(String baiduEndpoint) {
		this.endPoint = baiduEndpoint;
		return this;
	}

	public BOSServiceBuilder bucket(String bucket) {
		this.bucket = bucket;
		return this;
	}

	public BOSService build() {
		return new BOSService(this);
	}
}
