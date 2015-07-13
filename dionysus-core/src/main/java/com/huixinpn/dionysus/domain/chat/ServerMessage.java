package com.huixinpn.dionysus.domain.chat;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

/**
 * Created by huanghao on 7/5/15.
 */
@Data
public class ServerMessage {

    private String content;
    private String userName;
    private Long userId;
    private String userAvatar;
    private String timeStamp;

    public ServerMessage(String content, String username, Long userId, String userAvatar, String timeStamp) {
        this.content = content;
        this.userName = username;
        this.userId = userId;
        this.userAvatar = userAvatar;
        this.timeStamp = timeStamp;
    }

    public ServerMessage(String content, String userName, String timeStamp){
        this.content = content;
        this.userName = userName;
        this.timeStamp = timeStamp;
    }
}
