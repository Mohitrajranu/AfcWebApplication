package com.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mum.domain.Vacancy;
@Repository
public interface VacancyRepository extends CrudRepository<Vacancy, Long> {

}
