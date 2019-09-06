package com.mum.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.UserRole;
import com.mum.repository.UserRoleRepository;
import com.mum.services.UserRoleService;
@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService{
	@Autowired
	UserRoleRepository userRoleRepository;
	@Override
	public List<UserRole> getAll() {
		// TODO Auto-generated method stub
		return ( List<UserRole>)userRoleRepository.findAll();
	}

	@Override
	public UserRole getOneByPRimaryId(Long id) {
		// TODO Auto-generated method stub
		return userRoleRepository.findOne(id);
	}

	@Override
	public int save(UserRole entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean delete(UserRole entity) {
		// TODO Auto-generated method stub
		return false;
	}

}
