package org.dionysus.bae;

import java.util.List;

import org.springframework.cloud.AbstractCloudConnector;
import org.springframework.cloud.FallbackServiceInfoCreator;
import org.springframework.cloud.app.ApplicationInstanceInfo;
import org.springframework.cloud.service.UriBasedServiceData;

public class BAEConnector extends AbstractCloudConnector<UriBasedServiceData> {
//	private EnvironmentAccessor environment = new EnvironmentAccessor();
	
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public BAEConnector() {
        super((Class) BAEConfigServiceInfoCreator.class);
    }

	@Override
	public boolean isInMatchingCloud() {
		// SERVER_SORTWARE = bae/3.0
//		return environment.getEnvValue("SERVER_SOFTWARE") != null;
		return false;
	}

	@Override
	public ApplicationInstanceInfo getApplicationInstanceInfo() {
		// TODO Auto-generated method stub
		return null;
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
