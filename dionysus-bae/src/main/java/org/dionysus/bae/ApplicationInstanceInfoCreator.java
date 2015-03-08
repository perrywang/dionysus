package org.dionysus.bae;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.cloud.app.ApplicationInstanceInfo;
import org.springframework.cloud.app.BasicApplicationInstanceInfo;
import org.springframework.cloud.util.EnvironmentAccessor;

public class ApplicationInstanceInfoCreator {

	private EnvironmentAccessor environment;

	public ApplicationInstanceInfoCreator(EnvironmentAccessor environmentAccessor) {
		this.environment = environmentAccessor;
	}

	public ApplicationInstanceInfo createApplicationInstanceInfo() {
		String appname = environment.getEnvValue("BAE_ENV_APPID");
		String server = environment.getEnvValue("SERVER_SOFTWARE");
		String id = UUID.randomUUID().toString();

		Map<String, Object> appProperties = new HashMap<String, Object>();
		appProperties.put("server", server);
		appProperties.put("group", environment.getEnvValue("SUPERVISOR_GROUP_NAME"));
		appProperties.put("host", environment.getHost());

		return new BasicApplicationInstanceInfo(id, appname, appProperties);
	}
}