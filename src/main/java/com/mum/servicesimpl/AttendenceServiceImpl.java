package com.mum.servicesimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Attendence;
import com.mum.repository.AttendenceRepository;
import com.mum.services.AttendenceService;

@Service
@Transactional
public class AttendenceServiceImpl implements AttendenceService {
	@Autowired
	AttendenceRepository attendenceRepositorys;

	public List<Attendence> getAll() {
		// TODO Auto-generated method stub
		return (List<Attendence>) attendenceRepositorys.findAll();
	}

	public Attendence getOneByPRimaryId(Long id) {
		// TODO Auto-generated method stub
		System.out.println("this is service impl" + id);
		return attendenceRepositorys.findOne(id);
	}

	public int save(Attendence entity) {
		// TODO Auto-generated method stub
		System.out.println("this is service impl");
		try {
			attendenceRepositorys.save(entity);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("this is service impl error");

		}
		// attendenceRepositorys.save(entity);
		return 0;
	}

	public boolean delete(Attendence entity) {
		// TODO Auto-generated method stub
		attendenceRepositorys.delete(entity);
		return false;
	}

	@Override
	public Attendence getByUserIdandDate(Long employeeId, Date date) {
		// TODO Auto-generated method stub
//		return attendenceRepositorys.getByUserIdandDate(employeeId, date)et
		return null;
	}

}
