package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.user.Consultant;

@Repository
public interface ConsultantRepository extends JpaRepository<Consultant, Long> {
	@Override
	@PreAuthorize("#user.username == principal or hasRole('ADMIN')")
	Consultant save(Consultant user);

	@Override
	@PreAuthorize("#user.username == principal or hasRole('ADMIN')")
	void delete(Consultant user);

	@Override
	@PreAuthorize("#id == authentication.details")
	void delete(Long id);
}
