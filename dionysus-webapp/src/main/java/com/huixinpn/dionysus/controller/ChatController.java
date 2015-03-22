package com.huixinpn.dionysus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.huixinpn.dionysus.domain.Message;

@Controller
public class ChatController {

	@Autowired
	private SimpMessagingTemplate simp;

	@MessageMapping("/chat/{id}")
	public void handleChat(@Payload Message message, 
			@DestinationVariable("id") String id) throws Exception {
		message.setContent("from server: " + message.getContent());
		simp.convertAndSend("/topic/chat/" + id + "/messages", message);
	}
}
