package com.huixinpn.dionysus.domain.chat;

import lombok.Data;

/**
 * Created by huanghao on 7/5/15.
 */
@Data
public class ServerMessage {

    private String content;
    private String userName;
    private Integer userId;
    private String userAvatar;
    private String timeStamp;


    public void setContent(String content){
        this.content = content;
    }

    public String getContent(){
        return content;
    }
}
