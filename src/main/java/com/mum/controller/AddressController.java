package com.mum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	@RequestMapping({"", "/list"})
	public String showemployeeList(Model model) {
		System.out.println("inside address controller");
		return "addressList";
	}
}
