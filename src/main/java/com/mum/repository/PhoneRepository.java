package com.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mum.domain.Phone;
@Repository
public interface PhoneRepository extends CrudRepository<Phone,Long> {

}
