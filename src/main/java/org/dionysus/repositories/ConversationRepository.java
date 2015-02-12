package org.dionysus.repositories;

import org.dionysus.model.Conversation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "conversations", path = "conversations")
public interface ConversationRepository extends JpaRepository<Conversation, Long> {

}
