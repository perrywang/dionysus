package org.dionysus.bae;

import org.springframework.cloud.service.common.MongoServiceInfo;

public class MongoServiceInfoCreator extends BAEConfigServiceInfoCreator<MongoServiceInfo> {

	public MongoServiceInfoCreator() {
		super(MongoServiceInfo.MONGODB_SCHEME);
	}

	@Override
	public MongoServiceInfo createServiceInfo(String id, String uri) {
		return new MongoServiceInfo(id, uri);
	}
}