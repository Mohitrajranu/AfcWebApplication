package com.mum.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Phone;
import com.mum.repository.*;
import com.mum.services.PhoneService;
@Service
@Transactional
public class PhoneServiceImpl implements PhoneService{
	@Autowired
	PhoneRepository phoneRepository;
	public List<Phone> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Phone getOneByPRimaryId(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int save(Phone entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean delete(Phone entity) {
		// TODO Auto-generated method stub
		return false;
	}

}
