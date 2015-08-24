package com.huixinpn.dionysus.dto.article;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Blog;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by huanghao on 5/19/15.
 */
@Data
@NoArgsConstructor
public class ArticleData extends EntityData<Article> {
    private String title;
    private String summary;
    private String cover;
    private String type;

    private ArticleCategory category;

    public ArticleData(Article article){
        super(article);
        this.title = article.getTitle();
        this.summary = article.getSummary();
        this.cover = article.getCover();
        this.type = article.getType() == null? "unknown" : article.getType().toString();
        this.category = new ArticleCategory(article.getCategory());


    }

    public ArticleData(Blog article){
        this((Article)article);
    }

    @Override
    public void update(Article article){
        this.title = article.getTitle();
        this.summary = article.getSummary();
        this.cover = article.getCover();
        this.type = article.getType() == null? "unknown" : article.getType().toString();
        this.category = new ArticleCategory(article.getCategory());
    }
}
