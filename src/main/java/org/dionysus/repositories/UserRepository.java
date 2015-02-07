package org.dionysus.repositories;

import java.util.List;

import org.dionysus.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
	List<User> findByName(String name);
}
