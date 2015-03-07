package org.dionysus.controller;

import org.dionysus.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {

	@Autowired
	private SimpMessagingTemplate template;

	@MessageMapping("/chat/{id}")
	public void handleChat(@Payload Message message, 
			@DestinationVariable("id") String id) throws Exception {
		message.setContent("from server: " + message.getContent());
		template.convertAndSend("/topic/chat/" + id + "/messages", message);
	}
}
