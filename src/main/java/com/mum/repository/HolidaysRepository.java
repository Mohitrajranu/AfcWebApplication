package com.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mum.domain.Holidays;

@Repository
public interface HolidaysRepository extends CrudRepository<Holidays,Long> {

}
