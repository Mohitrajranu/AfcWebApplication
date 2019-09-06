package com.mum.intercepter;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class VolunteerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		return true;
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
	String userMessage = "Welcome";
 
		Principal principal = request.getUserPrincipal();
		

		if (principal != null) {
			if (request.isUserInRole("ROLE_ADMIN"))
				userMessage = "Welcome Admin";
			else 
				userMessage = "Welcome User";
 	}
	
//		System.out.println("Calling postHandle");
		modelAndView.getModelMap().addAttribute("SpecialBlurb", userMessage);

		return;
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
//		System.out.println("Calling afterCompletion");
		return;
	}

	
	
}
