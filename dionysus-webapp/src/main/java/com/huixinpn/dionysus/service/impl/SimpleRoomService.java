package com.huixinpn.dionysus.service.impl;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.huixinpn.dionysus.domain.chat.Room;
import com.huixinpn.dionysus.repository.chat.RoomRepository;
import com.huixinpn.dionysus.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * Created by huanghao on 7/13/15.
 */
@Service
public class SimpleRoomService implements RoomService {

    @Autowired
    private RoomRepository roomRepository;

    private LoadingCache<String, Room> roomLoadingCache = CacheBuilder.newBuilder()
            .expireAfterAccess(10, TimeUnit.MINUTES)
            .build(new CacheLoader<String, Room>() {

                @Override
                public Room load(String key) throws Exception {
                    return roomRepository.findOne(new Long(key));
                }

            });

    public Room getRoom(String id){
        try{
            Room room = this.roomLoadingCache.get(id);
            return room;
        }catch (Exception e){
            return null;
        }
    }
}
