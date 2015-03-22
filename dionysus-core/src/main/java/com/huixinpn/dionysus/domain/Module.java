package com.huixinpn.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "modules")
public class Module extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -3202875103419512957L;

	@Column(name = "title")
	private String title;

	@Column(name = "subtitle")
	private String subtitle;

	@Column(name = "image")
	private String image;
	
	@Column(name = "href")
	private String href;

	@Lob
	@Column(name = "body")
	private String body;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subTitle) {
		this.subtitle = subTitle;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}
}
