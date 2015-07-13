package com.huixinpn.dionysus.service.impl;

import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.repository.user.UserRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.concurrent.atomic.AtomicLong;

/**
 * Created by huanghao on 7/13/15.
 */
@Data
public class UserState {

    private AtomicLong lastAccess = new AtomicLong(System.currentTimeMillis());
    private String username;
    private String avatar;
    private Long id;

    public void mark(){
        lastAccess.set(System.currentTimeMillis());
    }

    public UserState(String username, String avatar, Long id) {
        this.username = username;
        this.avatar = avatar;
        this.id = id;

    }

    public long getLastAccess(){
        return lastAccess.get();
    }
}
