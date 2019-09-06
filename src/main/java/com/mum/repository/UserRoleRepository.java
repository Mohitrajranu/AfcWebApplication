package com.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mum.domain.UserRole;

@Repository
public interface UserRoleRepository extends CrudRepository<UserRole, Long>{
	UserRole findByRoleName(String roleName);
}
