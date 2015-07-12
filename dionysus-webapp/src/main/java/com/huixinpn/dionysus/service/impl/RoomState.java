package com.huixinpn.dionysus.service.impl;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.collect.Sets;
import com.huixinpn.dionysus.domain.user.User;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Created by huanghao on 7/13/15.
 */
public class RoomState {

    private LoadingCache<String, UserState> statsByUser = CacheBuilder.newBuilder()
            .maximumSize(100)
            .build(new CacheLoader<String, UserState>() {

                @Override
                public UserState load(String key) throws Exception {
                    return new UserState(key);
                }

            });


    public void mark(String username){
        statsByUser.getUnchecked(username).mark();
    }

    public HashMap<String, UserState> getActiveUsers(){
        HashMap<String, UserState> active = new HashMap<>();
        for (String user : statsByUser.asMap().keySet()) {
            // has the user checked in within the last 5 seconds?
            if ((System.currentTimeMillis() - statsByUser.getUnchecked(user).getLastAccess()) < 5000) {

                active.put(user, statsByUser.getUnchecked(user));
            }
        }
        return active;
    }

}
