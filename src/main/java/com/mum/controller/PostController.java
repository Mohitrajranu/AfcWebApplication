package com.mum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mum.domain.Post;
import com.mum.services.*;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired 
	PostService PostService;
	@RequestMapping({"", "/list"})
	public String showemployeeList(Model model) {
		System.out.println("inside post controllers");
		List<Post> postList=PostService.getAll();
		model.addAttribute("postList",postList);
		return "postList";
	}
}
