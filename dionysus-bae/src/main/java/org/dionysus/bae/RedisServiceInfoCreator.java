package org.dionysus.bae;

import org.springframework.cloud.service.common.RedisServiceInfo;

public class RedisServiceInfoCreator extends BAEConfigServiceInfoCreator<RedisServiceInfo>{

    public RedisServiceInfoCreator() {
        super(RedisServiceInfo.REDIS_SCHEME);
    }

    @Override
    public RedisServiceInfo createServiceInfo(String id, String uri) {
        return new RedisServiceInfo(id, uri);
    }
}