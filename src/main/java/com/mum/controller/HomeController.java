package com.mum.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mum.domain.User;
import com.mum.services.UserService;
@Controller
public class HomeController {
	@Autowired
	UserService userService;
	@RequestMapping("/welcome")
	public String welcome(Model model,HttpSession session) {
		System.out.println("inside home");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();              
		String name = auth.getName();
		User user=userService.findByUsername(name);
		session.setAttribute("user",user);
		return "welcome";
	}	
	@RequestMapping(value="/start", method = RequestMethod.GET)
	public ModelAndView start() {
		 ModelAndView mav = new ModelAndView("start");
		return mav;
	}
////home academy schedule group coach athlete
	 @RequestMapping(value="/home", method = RequestMethod.GET)
		public ModelAndView home() {
		 ModelAndView mav = new ModelAndView("home");
		return mav;
		}
	 
	 
}
