package com.huixinpn.dionysus.service;

import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.service.impl.UserState;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Created by huanghao on 7/12/15.
 */
public interface ActiveUserService {

    public void mark(String roomId, String username);

    public HashMap<String, UserState> getActiveUsers(String roomId);

    public Set<String> getActiveRooms();

    public UserState getActiveUser(String roomId, String username);


}
