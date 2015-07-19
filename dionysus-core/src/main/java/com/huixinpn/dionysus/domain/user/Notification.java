package com.huixinpn.dionysus.domain.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.repository.user.NotificationRepository;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "notification")
public class Notification extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = -7457760948182175014L;

	@NonNull
	@ManyToOne
	@JsonIgnore
	private Inbox inbox;

	/* Each sender can send many notifications */
	@NonNull
	@ManyToOne
	private User from;

	@NonNull
	private String summary;
}
