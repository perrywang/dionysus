package org.boilaplate.dionysus.rest;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.boilaplate.dionysus.entities.Article;

@Path("/articles")
public class ArticleService {

    @GET
    @Path("list")
    @Produces({ MediaType.APPLICATION_XML })
    public List<Article> findLatestArticle() {
        return new ArrayList<Article>();
    }
}
