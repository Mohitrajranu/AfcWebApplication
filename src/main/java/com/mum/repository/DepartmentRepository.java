package com.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mum.domain.Department;
@Repository
public interface DepartmentRepository extends CrudRepository<Department,Long>{

}
