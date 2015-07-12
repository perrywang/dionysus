package com.huixinpn.dionysus.controller;

import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.service.ActiveUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;

import org.springframework.stereotype.Controller;

import com.huixinpn.dionysus.domain.chat.ChatMessage;

import java.security.Principal;

@Controller
public class ChatController {

	@Autowired
	private SimpMessagingTemplate simp;

    @Autowired
    private ActiveUserService activeUserService;

	@MessageMapping("/chat/{id}")
	public void handleChat(@Payload ChatMessage chatMessage,
			@DestinationVariable("id") String id) throws Exception {
		chatMessage.setContent("from server: " + chatMessage.getContent());
		simp.convertAndSend("/topic/chat/" + id + "/messages", chatMessage);
	}

    @MessageMapping("/activeUsers/{id}")
    public void activeUsers(Message<Object> message, @DestinationVariable("id") String id) throws Exception{
        Principal user = message.getHeaders().get(SimpMessageHeaderAccessor.USER_HEADER, Principal.class);
        activeUserService.mark(id, user.getName());
    }
}
