package com.mum.servicesimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Leave;
import com.mum.repository.LeaveRepository;
import com.mum.services.LeaveService;

@Service
@Transactional
public class LeaveServiceImpl implements LeaveService {
	@Autowired
	LeaveRepository leaveRepository;
//	@Autowired
//	Userservice

	public List<Leave> getAll() {
		// TODO Auto-generated method stub
		//calculate no of days for each leave request
		return (List<Leave>) leaveRepository.findAll();
	}

	public Leave getOneByPRimaryId(Long id) {
		// TODO Auto-generated method stub
		return leaveRepository.findOne(id);
	}

	public int save(Leave entity) {
		// TODO Auto-generated method stub
		entity.setAppliedDate(new Date());
		leaveRepository.save(entity);
		return 0;
	}

	public boolean delete(Leave entity) {
		// TODO Auto-generated method stub
		leaveRepository.delete(entity);
		return false;
	}

}
