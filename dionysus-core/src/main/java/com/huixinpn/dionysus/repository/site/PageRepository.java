package com.huixinpn.dionysus.repository.site;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.site.Page;

@Repository
public interface PageRepository extends JpaRepository<Page, Long> {

}
