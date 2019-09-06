package com.mum.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Holidays;
import com.mum.repository.HolidaysRepository;
import com.mum.services.HolidaysService;

@Service
@Transactional
public class HolidaysServiceImpl implements HolidaysService {
	@Autowired
	HolidaysRepository holidayRepository;

	@Override
	public List<Holidays> getAll() {
		// TODO Auto-generated method stub
		return (List<Holidays>) holidayRepository.findAll();
	}

	@Override
	public Holidays getOneByPRimaryId(Long id) {
		// TODO Auto-generated method stub
		return holidayRepository.findOne(id);
	}

	@Override
	public int save(Holidays entity) {
		// TODO Auto-generated method stub
		holidayRepository.save(entity);
		return 0;
	}

	@Override
	public boolean delete(Holidays entity) {
		// TODO Auto-generated method stub
		holidayRepository.delete(entity);
		return false;
	}

}
