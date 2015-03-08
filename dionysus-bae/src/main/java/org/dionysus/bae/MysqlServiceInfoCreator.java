package org.dionysus.bae;

import org.springframework.cloud.service.common.MysqlServiceInfo;

public class MysqlServiceInfoCreator extends BAEConfigServiceInfoCreator<MysqlServiceInfo> {

	public MysqlServiceInfoCreator() {
		super(MysqlServiceInfo.MYSQL_SCHEME);
	}

	@Override
	public MysqlServiceInfo createServiceInfo(String id, String uri) {
		return new MysqlServiceInfo(id, uri);
	}
}