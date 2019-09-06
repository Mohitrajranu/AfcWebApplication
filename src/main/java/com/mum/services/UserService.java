package com.mum.services;

import com.mum.domain.User;

public interface UserService extends BaseService<User, Long> {
	public User findByUsername(String userName);
	
	

}
