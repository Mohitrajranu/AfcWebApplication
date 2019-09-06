package com.mum.services;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mum.domain.Vacancy;


public interface VacancyService extends BaseService<Vacancy, Long> {

}
