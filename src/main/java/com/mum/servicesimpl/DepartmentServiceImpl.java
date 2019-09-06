package com.mum.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Department;
import com.mum.repository.*;
import com.mum.services.DepartmentService;
@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired
	DepartmentRepository departmentRepository;
	public List<Department> getAll() {
		System.out.println("inside repository call for department getall()");
		return (List<Department>)departmentRepository.findAll();
	}

	public Department getOneByPRimaryId(Long id) {
		// TODO Auto-generated method stub
		return departmentRepository.findOne(id);
	}

	public int save(Department entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean delete(Department entity) {
		// TODO Auto-generated method stub
		return false;
	}

}
