package com.huixinpn.dionysus.domain.chat;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.user.User;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

//Use manual setter getter because the websocket can`t wrap the entity if use lOMBOK

@Entity
@Table(name = "messages")
public class ChatMessage extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = 7438768194716828137L;

    @NotNull
	@Column(name="content")
	private String content;

    @ManyToOne
    private Room room;

    @ManyToOne
    private User sender;

    @ManyToOne
    private User recipient;

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getRecipient() {
        return recipient;
    }

    public void setRecipient(User recipient) {
        this.recipient = recipient;
    }

    public String getContent() {
        return content;

    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setRoom(Room room){
        this.room = room;
    }

    public Room getRoom(){
        return room;
    }


}
