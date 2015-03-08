package org.dionysus.bae;

import org.springframework.cloud.service.ServiceInfo;
import org.springframework.cloud.service.UriBasedServiceInfoCreator;

public abstract class BAEConfigServiceInfoCreator<SI extends ServiceInfo> extends UriBasedServiceInfoCreator<SI> {

    protected BAEConfigServiceInfoCreator(String... uriSchemes) {
        super(uriSchemes);
    }
}