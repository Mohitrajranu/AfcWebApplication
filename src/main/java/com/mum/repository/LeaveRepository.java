package com.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mum.domain.Leave;

@Repository
public interface LeaveRepository extends CrudRepository<Leave,Long> {

}
