package com.huixinpn.dionysus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String name);
	@Query("select a from User a, Role b where a.id = b.user_id and b.role_name = ?1") 
	List<User> findByRole(String rolename);
}
