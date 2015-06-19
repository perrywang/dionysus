package com.huixinpn.dionysus.domain.article.projection;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.ArticleType;
import org.joda.time.DateTime;
import org.springframework.data.rest.core.config.Projection;


@Projection(name = "read", types = Article.class)
public interface ArticleSummary {
	public Long getId();

	public String getTitle();

	public String getSummary();
	
	public String getCover();

    public CategoryExcerpt getCategory();

    public ArticleType getType();

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    public DateTime getLastModifiedDate();

    //public UserExcerpt getCreatedBy();
}