package com.huixinpn.dionysus.controller.article;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.ArticleType;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.dto.article.ArticleData;
import com.huixinpn.dionysus.repository.article.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Created by huanghao on 5/19/15.
 */
@RestController
public class ArticleController {
    @Autowired
    private ArticleRepository articleRepository;

    @RequestMapping(value = "/articles/coverpage", method = RequestMethod.GET)
    public @ResponseBody
    EntityPageData<ArticleData> wantCoverPage(@RequestParam(value = "category", required = true)Category category,
                                        @RequestParam(value = "type", required = true)ArticleType type,
                                        @RequestParam(value = "size", required = true) Integer size){
        Page<Article> pageArticles = articleRepository.findAll(new PageRequest(0, size));
        return new EntityPageData<>(pageArticles, ArticleData.class);
    }
}
