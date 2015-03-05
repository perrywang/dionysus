package org.dionysus.service;

import org.dionysus.repository.ConversationRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "conversations", path = "conversations")
public interface ConversationService extends ConversationRepository {

}
