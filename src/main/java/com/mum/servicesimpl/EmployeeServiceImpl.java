package com.mum.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Department;
import com.mum.domain.Employee;
import com.mum.repository.EmployeeRepository;
import com.mum.repository.HolidaysRepository;
import com.mum.services.EmployeeService;
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	EmployeeRepository employeeRepository;
	public List<Employee> getAll() {
		System.out.println("inside repository call for employee getall()");
		return (List<Employee>)employeeRepository.findAll();
	}

	public Employee getOneByPRimaryId(Long id) {
		
		return employeeRepository.findOne(id);
	}

	public int save(Employee entity) {
		try{
			employeeRepository.save(entity);
			return 0;
		}
		catch(Exception e){
			System.out.println("error"+e.getMessage());
			return 1;
		}
	}

	public boolean delete(Employee entity) {
		employeeRepository.delete(entity);
		return false;
	}

	@Override
	public List<Employee> getEmployeeByDepartmentId(Long departmentId) {
		System.out.println("inside service getEmployeeByDepartmentId");
		return employeeRepository.getEmployeesByDepartmentId(departmentId);
		//return null;
	}

}
