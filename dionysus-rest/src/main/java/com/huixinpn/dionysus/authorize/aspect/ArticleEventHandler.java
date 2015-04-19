package com.huixinpn.dionysus.authorize.aspect;

import lombok.extern.slf4j.Slf4j;

import org.springframework.data.rest.core.annotation.HandleBeforeCreate;
import org.springframework.data.rest.core.annotation.HandleBeforeDelete;
import org.springframework.data.rest.core.annotation.HandleBeforeLinkDelete;
import org.springframework.data.rest.core.annotation.HandleBeforeSave;
import org.springframework.data.rest.core.annotation.RepositoryEventHandler;
import org.springframework.security.access.prepost.PreAuthorize;

import com.huixinpn.dionysus.domain.article.Article;

@RepositoryEventHandler(Article.class)
@Slf4j
public class ArticleEventHandler {

	@HandleBeforeCreate
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void checkCreateAuthority(Article article) {
		log.debug("Creating article {}", article);
	}
	
	@HandleBeforeSave
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void checkUpdateAuthority(Article article) {
		log.debug("Updating article {}", article);
	}
	
	@HandleBeforeDelete
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void checkDeleteAuthority(Article article) {
        log.debug("Deleting article {}", article);
    }

    @HandleBeforeLinkDelete
    @PreAuthorize("denyAll()")
    public void deleteCredentialForbidden(Article article) {
        //deny all, cannot be called
    }
}
