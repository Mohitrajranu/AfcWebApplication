package com.mum.services;

import java.util.List;

import com.mum.domain.Employee;

public interface EmployeeService extends BaseService<Employee,Long> {
	 public List<Employee> getEmployeeByDepartmentId(Long departmentId);
}
