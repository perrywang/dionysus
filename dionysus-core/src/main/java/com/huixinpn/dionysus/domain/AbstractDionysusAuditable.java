package com.huixinpn.dionysus.domain;

import java.util.Date;

import javax.persistence.EntityListeners;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;

import lombok.NoArgsConstructor;
import org.joda.time.DateTime;
import org.springframework.data.domain.Auditable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@EntityListeners(AuditingEntityListener.class)
@MappedSuperclass
public abstract class AbstractDionysusAuditable<U> extends
		AbstractDionysusPersistable implements Auditable<U, Long> {

	private static final long serialVersionUID = 5479110990406240175L;

	@ManyToOne
	private U createdBy;

    @JsonIgnore
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

	@ManyToOne
	private U lastModifiedBy;

    @JsonIgnore
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModifiedDate;

	public AbstractDionysusAuditable(Long id){
		super(id);
	}

	@Override
	public U getCreatedBy() {
		return createdBy;
	}

	@Override
	public void setCreatedBy(final U createdBy) {
		this.createdBy = createdBy;
	}

	@Override
	public DateTime getCreatedDate() {
		return null == createdDate ? null : new DateTime(createdDate);
	}

	@Override
	public void setCreatedDate(final DateTime createdDate) {
		this.createdDate = null == createdDate ? null : createdDate.toDate();
	}

	@Override
	public U getLastModifiedBy() {
		return lastModifiedBy;
	}

	@Override
	public void setLastModifiedBy(final U lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	@Override
	public DateTime getLastModifiedDate() {
		return null == lastModifiedDate ? null : new DateTime(lastModifiedDate);
	}

	public void setLastModifiedDate(final DateTime lastModifiedDate) {
		this.lastModifiedDate = null == lastModifiedDate ? null
				: lastModifiedDate.toDate();
	}
}
