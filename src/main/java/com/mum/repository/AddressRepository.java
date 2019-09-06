package com.mum.repository;

import org.springframework.data.repository.CrudRepository;

import com.mum.domain.Address;

public interface AddressRepository extends CrudRepository<Address,Long>{

}
