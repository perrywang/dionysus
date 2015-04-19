package com.huixinpn.dionysus.domain.chat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@Entity
@RequiredArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Table(name = "messages")
public class Message extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 7438768194716828137L;

	@NonNull
	@Column(name="content")
	private String content;
}
