package com.mum.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mum.domain.Attendence;

@Repository
public interface AttendenceRepository extends CrudRepository<Attendence, Long> {
//	@Query("SELECT * FROM attendance a WHERE a.userId=: userId AND a.date=:date")
//	Attendence getByUserIdandDate(@Param("userId") Long userId, @Param("date") Date date);

}
