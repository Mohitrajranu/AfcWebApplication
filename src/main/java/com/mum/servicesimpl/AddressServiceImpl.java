package com.mum.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Address;
import com.mum.repository.*;
import com.mum.services.AddressService;
@Service
@Transactional
public class AddressServiceImpl implements AddressService{
	@Autowired
	AddressRepository addressRepository;
	public List<Address> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Address getOneByPRimaryId(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int save(Address entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean delete(Address entity) {
		// TODO Auto-generated method stub
		return false;
	}

}
