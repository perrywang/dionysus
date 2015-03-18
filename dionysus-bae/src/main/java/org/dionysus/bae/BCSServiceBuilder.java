package org.dionysus.bae;

import java.io.File;

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

	public BCSServiceBuilder accessKey(String accessKey){
		
		this.accessKey = accessKey;
		return this;
	}
	
    public BCSServiceBuilder secretKey(String secretKey){
		
		this.secretKey = secretKey;
		return this;
	} 
    
    public BCSServiceBuilder baiduEndpoint(String baiduEndpoint){
		
		this.baiduEndpoint = baiduEndpoint;
		return this;
	}
    
    public BCSServiceBuilder imageBucket(String imageBucket){
    	
    	this.imageBucket = imageBucket;
    	return this;
    }
    
    public BCSServiceBuilder videoBucket(String videoBucket){
    	
    	this.videoBucket = videoBucket;
    	return this;
    }
    
    public BCSServiceBuilder fileBucket(String fileBucket){
    	
    	this.fileBucket = fileBucket;
    	return this;
    }
	
    
    public BCSService build(){
    	
    	return new BCSService(this);
    }
    
    public static void main(String[] args) {
    	
    	BCSServiceBuilder builder = new BCSServiceBuilder();
    	BCSService bcs = builder.accessKey("xN3Lv2liVPWHfu5ywr0UPWoT")
    	       .secretKey("L7Yc5LOT2SgYtZidaN0eHFQ1ZLLnGh8c")
    	       .baiduEndpoint("bcs.duapp.com")
    	       .imageBucket("dionysus-images")
    	       .videoBucket("dionysus-videos")
    	       .fileBucket("dionysus-files")
    	       .build();
    	try{
    	    bcs.storeImage(new File("C:\\yujinxiang.jpg"));
    	}catch(StoreException e){
    		//
    	}
    }
	
	
	
}
