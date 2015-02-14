package org.dionysus.repository;

import org.dionysus.domain.Conversation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "conversations", path = "conversations")
public interface ConversationRepository extends JpaRepository<Conversation, Long> {

}
