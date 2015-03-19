package org.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "bcsmedias", uniqueConstraints={@UniqueConstraint(columnNames = {"filename", "type"})})
public class BCSMedia extends AbstractDionysusAuditable<User>{
	
	private static final long serialVersionUID = -1815965724911286764L;
	
	@NotEmpty
	@Column(name = "filename")
	private String filename;
	
	@Column(name = "type")
	@Enumerated(EnumType.STRING)
	private BCSMediaType type;
	
	@Column(name = "url")
	private String url;
	
	public BCSMedia(){
		
	}
	
	public BCSMedia(String filename, BCSMediaType type, String url) {
		this.filename = filename;
		this.type = type;
		this.url = url;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public BCSMediaType getType() {
		return type;
	}

	public void setType(BCSMediaType type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}	
	
}


