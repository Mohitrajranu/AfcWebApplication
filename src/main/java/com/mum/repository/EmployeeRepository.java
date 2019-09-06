package com.mum.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mum.domain.*;
@Repository
public interface EmployeeRepository extends CrudRepository<Employee,Long> {
	@Query("select e from employee e where e.department.departmentId = :departmentId")
	public List<Employee> getEmployeesByDepartmentId(@Param("departmentId") long departmentId);
}
