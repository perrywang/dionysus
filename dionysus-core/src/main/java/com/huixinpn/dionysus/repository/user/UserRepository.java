package com.huixinpn.dionysus.repository.user;

import com.huixinpn.dionysus.domain.user.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	User findByUsername(String name);

	// @Query("select a from User a, Role b where a.id = b.user_id and b.role_name = ?1")
	// List<User> findByRole(String rolename);

	@Override
    //@PreAuthorize("#user.username == principal or hasRole('ADMIN')")
	<S extends User> S save(S user);

	@Override
	@PreAuthorize("#user.username == principal or hasRole('ADMIN')")
	void delete(User user);

	@Override
	@PreAuthorize("#id == authentication.details")
	void delete(Long id);
}
