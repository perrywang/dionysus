package org.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "pages")
public class Page extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -3202875103419512957L;

	@Column(name = "title")
	private String title;

	@Column(name = "subtitle")
	private String subTitle;

	@Column(name = "image")
	private String image;

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

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
