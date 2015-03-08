package org.dionysus.bae;

import java.util.List;

import org.springframework.cloud.AbstractCloudConnector;
import org.springframework.cloud.CloudException;
import org.springframework.cloud.FallbackServiceInfoCreator;
import org.springframework.cloud.app.ApplicationInstanceInfo;
import org.springframework.cloud.service.UriBasedServiceData;
import org.springframework.cloud.util.EnvironmentAccessor;

public class BAEConnector extends AbstractCloudConnector<UriBasedServiceData> {
	
	private EnvironmentAccessor environment = new EnvironmentAccessor();
	private ApplicationInstanceInfoCreator applicationInstanceInfoCreator = 
			new ApplicationInstanceInfoCreator(environment);

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public BAEConnector() {
		super((Class) BAEConfigServiceInfoCreator.class);
	}

	// SERVER_SORTWARE = bae/3.0
	@Override
	public boolean isInMatchingCloud() {
		return environment.getEnvValue("SERVER_SOFTWARE") != null;
	}

	@Override
	public ApplicationInstanceInfo getApplicationInstanceInfo() {
		try {
			return applicationInstanceInfoCreator.createApplicationInstanceInfo();
		} catch (Exception e) {
			throw new CloudException(e);
		}
	}

	@Override
	protected List<UriBasedServiceData> getServicesData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected FallbackServiceInfoCreator<?, UriBasedServiceData> getFallbackServiceInfoCreator() {
		// TODO Auto-generated method stub
		return null;
	}

}
