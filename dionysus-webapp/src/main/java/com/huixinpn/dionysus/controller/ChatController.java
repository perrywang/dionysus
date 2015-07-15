package com.huixinpn.dionysus.controller;

import com.huixinpn.dionysus.domain.chat.ChatMessage;
import com.huixinpn.dionysus.domain.chat.Room;
import com.huixinpn.dionysus.domain.chat.ServerMessage;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.repository.chat.ChatMessageRepository;
import com.huixinpn.dionysus.service.ActiveUserService;
import com.huixinpn.dionysus.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ChatController {

	@Autowired
	private SimpMessagingTemplate simp;

    @Autowired
    private ActiveUserService activeUserService;

    @Autowired
    private ChatMessageRepository chatMessageRepository;

    @Autowired
    private RoomService roomService;

	@MessageMapping("/chat/{id}")
	public void handleChat(Message<Object> message, @Payload ChatMessage chatMessage,
			@DestinationVariable("id") String id) throws Exception {

        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(message);
        Principal userPrincipal = headerAccessor.getUser();
        String userName = userPrincipal.getName();
        User userDetail = (User)(((UsernamePasswordAuthenticationToken)userPrincipal).getPrincipal());
        //UserState userState= activeUserService.getActiveUser(id, userName);
        Room room = roomService.getRoom(id);
        DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String dateStr =format.format(new Date());
        if (room != null){
            if (room.getOpen()){
                chatMessage.setRoom(room);
                chatMessage.setSender(userDetail);
                chatMessageRepository.save(chatMessage);

                ServerMessage serverMessage = new ServerMessage(chatMessage.getContent(), userName, userDetail.getId(), userDetail.getAvatar(),dateStr );
                simp.convertAndSend("/topic/chat/" + id + "/messages", serverMessage);
            }
            else{
                ServerMessage serverMessage = new ServerMessage("此聊天室已关闭", "汇心小编", dateStr);
                simp.convertAndSend("/topic/chat/" + id + "/messages", serverMessage);
            }
        }
        else {
            ServerMessage serverMessage = new ServerMessage("此聊天室不存在", "汇心小编", dateStr);
            simp.convertAndSend("/topic/chat/" + id + "/messages", serverMessage);
        }

	}

    @MessageMapping("/activeUsers/{id}")
    public void activeUsers(Message<Object> message, @DestinationVariable("id") String id, Principal principal) throws Exception{
        Principal user = message.getHeaders().get(SimpMessageHeaderAccessor.USER_HEADER, Principal.class);
        activeUserService.mark(id, user.getName());
    }
}
