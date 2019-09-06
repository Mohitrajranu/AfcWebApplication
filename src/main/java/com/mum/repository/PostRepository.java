package com.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mum.domain.Post;

@Repository
public interface PostRepository extends CrudRepository<Post,Long> {

}
