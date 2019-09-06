package com.mum.deniedPage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DenialController {
	
	@RequestMapping("/denial")
	public String deniedPage(Model model) {
		System.out.println("inside denial");
		return "deniedPage";
	}

}
