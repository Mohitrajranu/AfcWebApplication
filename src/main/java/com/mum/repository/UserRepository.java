package com.mum.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	@Query("select u from User u where u.userName=:userName")
	public User findByUserName(@Param("userName")String userName);

	@Query("select u from User u where u.email=:email")
	public User findByEmail(@Param("email")String email);
	
	@Transactional
    @Modifying(clearAutomatically = true)
	@Query("update User u set u.password = ?1 where u.email = ?2")
	int setPasswordByEmail(String password, String email);
	
	//email
}
