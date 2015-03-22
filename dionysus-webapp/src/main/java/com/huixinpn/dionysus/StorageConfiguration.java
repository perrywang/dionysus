package com.huixinpn.dionysus;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.huixinpn.dionysus.storage.StorageService;
import com.huixinpn.dionysus.storage.bae.BCSServiceBuilder;

@Configuration
public class StorageConfiguration {

	@Bean
	public StorageService bae() {
		BCSServiceBuilder builder = new BCSServiceBuilder();
		return  builder.accessKey("xN3Lv2liVPWHfu5ywr0UPWoT")
				.secretKey("L7Yc5LOT2SgYtZidaN0eHFQ1ZLLnGh8c")
				.baiduEndpoint("bcs.duapp.com")
				.imageBucket("dionysus-images")
				.videoBucket("dionysus-videos")
				.fileBucket("dionysus-files")
				.build();
	}
}
