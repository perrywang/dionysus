package com.huixinpn.dionysus.domain.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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
public class Notification extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -7457760948182175014L;

	@NonNull
	@ManyToOne
	@JoinColumn(name = "inbox_id")
	private Inbox inbox;

	/* Each notification has the only sender */
	@NonNull
	@OneToOne
	@JoinColumn(name = "user_id")
	private User from;

	@NonNull
	@Column(name = "summary")
	private String summary;
}
