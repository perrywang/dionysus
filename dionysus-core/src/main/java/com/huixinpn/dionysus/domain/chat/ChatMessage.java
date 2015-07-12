package com.huixinpn.dionysus.domain.chat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;


@Entity
@Table(name = "messages")
public class ChatMessage extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = 7438768194716828137L;

    @NotNull
	@Column(name="content")
	private String content;

    @ManyToOne
    private Room room;

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
