package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.user.Inbox;

@Repository
public interface InboxRepository extends JpaRepository<Inbox, Long> {

	@Override
	//@PreAuthorize("#inbox.user.username == principal")
	Inbox save(Inbox inbox);
}