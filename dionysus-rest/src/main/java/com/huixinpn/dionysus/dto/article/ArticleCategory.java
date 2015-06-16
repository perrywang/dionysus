package com.huixinpn.dionysus.dto.article;

import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by huanghao on 5/19/15.
 */
@Data
@NoArgsConstructor
public class ArticleCategory extends EntityData<Category> {
    private String name;

    public ArticleCategory(Category category){
        super(category);
        this.name = category.getName();
    }

    @Override
    public void update(Category entity) {
        entity.setName(this.getName());
    }
}
