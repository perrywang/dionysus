package com.huixinpn.dionysus.scheduler;

import com.huixinpn.dionysus.domain.chat.Room;
import com.huixinpn.dionysus.repository.chat.RoomRepository;
import com.huixinpn.dionysus.service.ActiveUserService;
import com.huixinpn.dionysus.service.impl.UserState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.HashMap;

/**
 * Created by huanghao on 7/14/15.
 */
@Component
public class RoomAttendeeCounter {

    @Autowired
    private ActiveUserService activeUserService;

    @Autowired
    private RoomRepository roomRepository;

    @Scheduled(fixedRate = 300000)
    public void countAttendee(){
        for(String roomId : activeUserService.getActiveRooms()){
            HashMap<String, UserState> users = activeUserService.getActiveUsers(roomId);
            Room room = roomRepository.findOne(new Long(roomId));
            if(room != null){
                room.setAttendeeCount(users.size());
                roomRepository.saveAndFlush(room);
            }
        }
    }
}
