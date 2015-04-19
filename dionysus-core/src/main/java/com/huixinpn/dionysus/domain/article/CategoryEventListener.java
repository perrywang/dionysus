package com.huixinpn.dionysus.domain.article;

import lombok.extern.slf4j.Slf4j;

import org.springframework.data.rest.core.annotation.HandleBeforeCreate;
import org.springframework.data.rest.core.annotation.HandleBeforeDelete;
import org.springframework.data.rest.core.annotation.HandleBeforeLinkDelete;
import org.springframework.data.rest.core.annotation.HandleBeforeSave;
import org.springframework.data.rest.core.annotation.RepositoryEventHandler;
import org.springframework.security.access.prepost.PreAuthorize;

@RepositoryEventHandler(Category.class)
@Slf4j
public class CategoryEventListener {
	
	@HandleBeforeCreate
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void checkCreateAuthority(Category category) {
		log.debug("Creating category {}", category);
	}
	
	@HandleBeforeSave
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void checkUpdateAuthority(Category category) {
		log.debug("Updating category {}", category);
	}
	
	@HandleBeforeDelete
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void checkDeleteAuthority(Category category) {
        log.debug("Deleting category {}", category);
    }

    @HandleBeforeLinkDelete
    @PreAuthorize("denyAll()")
    public void deleteCredentialForbidden(Category category) {
        //deny all, cannot be called
    }
}
