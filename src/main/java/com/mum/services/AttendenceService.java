package com.mum.services;

import java.util.Date;

import com.mum.domain.Attendence;

public interface AttendenceService  extends BaseService<Attendence,Long> {

	Attendence getByUserIdandDate(Long employeeId, Date date);
	
}
