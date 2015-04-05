package com.huixinpn.dionysus.meta;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.validator.constraints.NotEmpty;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.User;

@Entity
@Table(name = "bcsmedias")
public class BCSMedia extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = -1815965724911286764L;

  private String bucket;

  private String object;

	private String filename;

  private String mimetype;

	private String url;

	public BCSMedia() { }

  public String getBucket() {
    return bucket;
  }

  public void setBucket(String bucket) {
    this.bucket = bucket;
  }

  public String getObject() {
    return object;
  }

  public void setObject(String object) {
    this.object = object;
  }

  public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

  public String getMimetype() {
    return mimetype;
  }

  public void setMimetype(String mimetype) {
    this.mimetype = mimetype;
  }

  public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
