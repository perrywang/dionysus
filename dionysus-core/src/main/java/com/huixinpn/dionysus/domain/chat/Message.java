package com.huixinpn.dionysus.domain.chat;

import javax.persistence.*;

import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;

//@Data
@Entity
//@RequiredArgsConstructor
//@EqualsAndHashCode(callSuper = true)
@Table(name = "messages")
public class Message extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = 7438768194716828137L;

	//@NonNull
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

}
