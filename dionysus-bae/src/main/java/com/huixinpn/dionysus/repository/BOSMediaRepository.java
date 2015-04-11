package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.meta.BOSMedia;

@Repository
public interface BOSMediaRepository extends JpaRepository<BOSMedia, Long> {
	BOSMedia findByObject(String object);
}
