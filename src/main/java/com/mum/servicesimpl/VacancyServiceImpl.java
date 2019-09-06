package com.mum.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Vacancy;
import com.mum.repository.VacancyRepository;
import com.mum.services.VacancyService;
@Service
@Transactional
public class VacancyServiceImpl implements VacancyService{
	@Autowired
	VacancyRepository 	vacancyRepository;

	@Override
	public List<Vacancy> getAll() {
		return (List<Vacancy>) vacancyRepository.findAll();
	}

	@Override
	public Vacancy getOneByPRimaryId(Long id) {
		// TODO Auto-generated method stub
		return vacancyRepository.findOne(id);
	}

	@Override
	public int save(Vacancy entity) {
		try{
			 vacancyRepository.save(entity);
			
		}catch(Exception e){
			 return 1;
			
		}
		return 0;
		
		
	}

	@Override
	public boolean delete(Vacancy entity) {
		try{
		vacancyRepository.delete(entity);
		}catch(Exception e){
			return false;
			
		}
		return true;
	}

}
