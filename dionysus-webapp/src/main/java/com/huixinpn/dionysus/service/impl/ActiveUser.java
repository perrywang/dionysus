package com.huixinpn.dionysus.service.impl;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.service.ActiveUserService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Created by huanghao on 7/13/15.
 */

@Service
public class ActiveUser implements ActiveUserService {

    private LoadingCache<String, RoomState> statsByRoom = CacheBuilder.newBuilder()
            .maximumSize(50)
            .build(new CacheLoader<String, RoomState>() {

                @Override
                public RoomState load(String key) throws Exception {
                    return new RoomState();
                }

            });

    @Override
    public void mark(String roomId, String username) {
        statsByRoom.getUnchecked(roomId).mark(username);
    }

    @Override
    public HashMap<String, UserState> getActiveUsers(String roomId) {
        return statsByRoom.getUnchecked(roomId).getActiveUsers();
    }


}
