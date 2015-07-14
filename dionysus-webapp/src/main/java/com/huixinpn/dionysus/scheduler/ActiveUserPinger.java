package com.huixinpn.dionysus.scheduler;

import com.huixinpn.dionysus.service.ActiveUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by huanghao on 7/13/15.
 */

@Component
public class ActiveUserPinger {

    @Autowired
    private ActiveUserService activeUserService;

    @Autowired
    private SimpMessagingTemplate msgTemplate;

    @Scheduled(fixedDelay = 5000)
    public void pingUsers(){

        for(String roomId : activeUserService.getActiveRooms()){
            msgTemplate.convertAndSend("/topic/chat/" + roomId + "/active", activeUserService.getActiveUsers(roomId));
        }
    }
}
