package org.dionysus.repository;

import java.util.List;

import org.dionysus.domain.BCSMedia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BCSMediaRepository extends JpaRepository<BCSMedia, Long> {
	
	@Query("select b from BCSMedia b where b.type = 'IMAGE'")
	List<BCSMedia> findAllImages();
	
	@Query("select b from BCSMedia b where b.type = 'IMAGE' and b.filename = :filename")
	BCSMedia findImageByName(String fileName);
	
}
