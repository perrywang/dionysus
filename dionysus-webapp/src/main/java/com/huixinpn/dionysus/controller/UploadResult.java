package com.huixinpn.dionysus.controller;

import java.io.Serializable;

public class UploadResult implements Serializable {

	private static final long serialVersionUID = -3932276565153063936L;

	private String link;

	public UploadResult(String link) {
		super();
		this.link = link;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
