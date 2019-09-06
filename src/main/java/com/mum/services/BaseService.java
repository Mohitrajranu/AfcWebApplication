package com.mum.services;

import java.util.List;

public interface  BaseService<T,S> {
	List<T> getAll();
	T getOneByPRimaryId(S id);
	int save(T entity);
	boolean delete(T entity);
	
}
