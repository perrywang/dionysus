package com.huixinpn.dionysus.domain.article;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;
import javax.validation.Valid;

import com.huixinpn.dionysus.domain.event.NotificationListener;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import org.hibernate.annotations.Cascade;
import org.hibernate.validator.constraints.NotBlank;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.user.User;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ToString(of = { "title" })
@Entity
@Table(name = "articles")
@Inheritance(strategy = InheritanceType.JOINED)
public class Article extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = 4106093798545531113L;

	@NonNull
	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob
	@Column(name = "summary")
	private String summary;

	@Valid
	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	private Category category;

	@NonNull
	@NotBlank
	@Lob
	@Column(name = "body")
	private String body;
	
	@Column(name = "cover")
	private String cover;

    @Column(name = "articletype")
    @Enumerated(EnumType.STRING)
    private ArticleType type;

    @Column(name = "interview")
    private Boolean interview;

	@Version
	@Column(name = "version", columnDefinition = "integer DEFAULT 0", nullable = false)
	private Long version;

	@OneToMany(mappedBy = "article", cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
	private List<Comment> comments = new ArrayList<>();

    @OneToOne(cascade = {CascadeType.PERSIST}, fetch = FetchType.EAGER)
    private ArticleReadCounter readCounter;

	@PreUpdate
    @PrePersist
    public void extractCoverFromBody() {
        String html = this.getBody();
        Document doc = Jsoup.parse(html); 
        Element el = doc.select("img").first();
        if (el != null) {
            String img = el.attr("src");
            this.setCover(img);
        }
    }
}
