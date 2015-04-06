package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.meta.BCSMedia;

@Repository
public interface BCSMediaRepository extends JpaRepository<BCSMedia, Long> {
	BCSMedia findByObject(String object);
}
