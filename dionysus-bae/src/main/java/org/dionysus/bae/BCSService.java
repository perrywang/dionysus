package org.dionysus.bae;

import java.io.File;

import com.baidu.inf.iis.bcs.BaiduBCS;
import com.baidu.inf.iis.bcs.auth.BCSCredentials;
import com.baidu.inf.iis.bcs.http.HttpMethodName;
import com.baidu.inf.iis.bcs.request.GenerateUrlRequest;

public class BCSService {
	
	private BaiduBCS bcs;
	private String imageBucket;
	private String videoBucket;
	private String fileBucket;
	private static String objectPrefix = "/";
	
	public BCSService(BCSServiceBuilder builder){
		
		this.imageBucket = builder.getImageBucket();
		this.videoBucket = builder.getVideoBucket();
		this.fileBucket = builder.getFileBucket();
		BCSCredentials credential = new BCSCredentials(builder.getAccessKey(), builder.getSecretKey());
		bcs = new BaiduBCS(credential, builder.getBaiduEndpoint());
		bcs.setDefaultEncoding("UTF-8");
	}
	
	
	public String storeImage(File file) throws StoreException {
		return store(imageBucket,file);
	}
	
	public void deleteImage(String fileName) throws StoreException {
		
		delete(imageBucket,fileName);
	}
	
	public String storeVideo(File file) throws StoreException {
		return store(videoBucket,file);
	}
	
    public void deleteVideo(String videoName) throws StoreException {
		
		delete(imageBucket,videoName);
	}
	
	public String storeFile(File file) throws StoreException {
		return store(fileBucket, file);
	}
	
	public void deleteFile(String fileName) throws StoreException {
		delete(fileBucket, fileName);
	}
	
	private String store(String bucket, File file) throws StoreException{
		String object = objectPrefix + file.getName();
		try{
			bcs.putObject(bucket, object, file);
		}catch(Exception t){
			throw new StoreException("store file " + file.getName() + " failed", t);
		}
		GenerateUrlRequest urlRuest = new GenerateUrlRequest(HttpMethodName.GET, bucket, object);
		return bcs.generateUrl(urlRuest);
	}
	
	private void delete(String bucket, String fileName) throws StoreException {		
		String object = objectPrefix + fileName;
		try{
        	bcs.deleteObject(bucket, object);
        }catch(Exception t){
        	throw new StoreException("delete file " + fileName + " failed", t);
        }
	}
}
