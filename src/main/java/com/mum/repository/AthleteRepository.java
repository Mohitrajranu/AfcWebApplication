package com.mum.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Athlete;


public interface AthleteRepository extends JpaRepository<Athlete, Long> {
	@Query(value="select * from athlete_tbl where id=?", nativeQuery=true)
	Athlete findAth(Long id);
	
	Athlete findByFirstName(String s);
	
	@Modifying
	@Query(value="delete from athlete_tbl where Trainig_Base = ?" , nativeQuery=true)
	@Transactional
	public void deleteAth(Long aid);

	
}
