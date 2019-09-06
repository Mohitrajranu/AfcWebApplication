package com.mum.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

//import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;

import com.mum.domain.HiddenValueBean;
import com.mum.domain.Registration;
import com.mum.domain.User;
import com.mum.domain.UserRole;
import com.mum.repository.UserRepository;
import com.mum.repository.UserRoleRepository;
import com.mum.services.UserService;
import com.mum.servicesimpl.MailService;
import com.mum.servicesimpl.SecurityService;

@Controller
public class LoginController {

	@Autowired
	private MailService mailService; 
	@Autowired
	private RegistrationValidation userValidator;
	@Autowired
	private UserService userService;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserRoleRepository roleRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private SecurityService securityService;
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("userForm", new Registration());

		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") Registration userForm, BindingResult bindingResult, Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		User user = new User();
		user.setActive(1);
		user.setEmail(userForm.getEmail());
		user.setPassword(bCryptPasswordEncoder.encode(userForm.getPasswordConfirm()));
		user.setUserName(userForm.getUsername());
		UserRole userRole = roleRepository.findByRoleName("ROLE_USER");
		user.setUserRole(userRole);
		//  user.setUserRole(2);
		userService.save(user);

		securityService.autologin(userForm.getUsername(), userForm.getPassword());

		return "redirect:/start";
	}

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("inside login");
		return "login";
	}
	
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String about() {
		System.out.println("inside about");
		return "about";
	}
	@RequestMapping(value="/blog", method = RequestMethod.GET)
	public String blog() {
		System.out.println("inside blog");
		return "blog";
	}
	@RequestMapping(value="/team", method = RequestMethod.GET)
	public String team() {
		System.out.println("inside team");
		return "team";
	}
	@RequestMapping(value="/singleblog", method = RequestMethod.GET)
	public String singleblog() {
		System.out.println("inside singleblog");
		return "single-blog";
	}

	@RequestMapping(value="/news", method = RequestMethod.GET)
	public String news() {
		System.out.println("inside news");
		return "news";
	}
	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String contact() {
		System.out.println("inside contact");
		return "contact";
	}
	//// home academy schedule group coach athlete
	
	
	
	@RequestMapping(value={"/","/index"}, method = RequestMethod.GET)
	public String index(Model map) {
		
	//	
		List<String> fileNames = new ArrayList<>();
		List<String> videos = new ArrayList<>();
		
		File file = new File("/usr/local/tomcat9/webapps/AFCForce/resources/images/afcImages");
		File video = new File("/usr/local/tomcat9/webapps/AFCForce/resources/videos/AfcVideos");
		
		File[] files = file.listFiles();
		for(File f: files){
			fileNames.add(f.getName());
		}
		
		File[] videofiles = video.listFiles();
		for(File vd: videofiles){
			videos.add(vd.getName());
		}
		map.addAttribute("files", fileNames);
		map.addAttribute("videos", videos);
		System.out.println("inside index");
		return "index";
	}
	
	@RequestMapping(value="/forgotPassword", method = RequestMethod.GET)
	public String forgotPassword()
	{
		return "forgotPassword"; 
	}

	@RequestMapping(value="/resetPassword" , method=RequestMethod.POST)
	public String resetRequest(@RequestParam(value="email") String email)
	{
		//check if the email id is valid and registered with us.
		mailService.sendMail(email);
		return "checkMail";
	}

	@RequestMapping(value="/newPassword", method = RequestMethod.GET)
	public String resetPassword(@RequestParam(value="email") String email,ModelMap model)
	{
		//check if the email id is valid and registered with us.
		HiddenValueBean hb = new HiddenValueBean();
		//hb.setHiddenMessage(email);
		model.put("emailid", email);
		model.put("hb", hb);
		//return new ModelAndView("newPassword","model",hb);
		return "newPassword";
	}
	@RequestMapping(value="/newPassword", method=RequestMethod.POST)
    public String processForm(@ModelAttribute("hb") HiddenValueBean hb) {
        System.out.println("Validation Passed");
        System.out.println(">>>>" + hb.getHiddenMessage());
        User user=userRepository.findByEmail(hb.getHiddenMessage());
        user.setPassword(bCryptPasswordEncoder.encode(hb.getPasswordConfirm()));
        userService.save(user);
        return "login";
    }
	/*
	 @RequestMapping("/HiddenValueExample")
    public String initializeForm(Map model) {
        HiddenValueBean hb = new HiddenValueBean();
        model.put("hb", hb);
        return "SpringMVC_HiddenValueExample";
    }

    @RequestMapping("/processHiddenValue")
    public String processForm(@ModelAttribute("hb") HiddenValueBean hb) {
        System.out.println("Validation Passed");

        System.out.println(">>>>" + hb.getHiddenMessage());
        return "hiddenvalue_Success";
    }
	*/
	/*@RequestMapping(value="/confirmPassword" , method=RequestMethod.POST)
	public String confirmPassword(@RequestParam(value="email") String email)
	{
		//check if the email id is valid and registered with us.
		
		return "login";
	}*/
	

	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(Model model) {
		model.addAttribute("error", "true");
		return "login";
	}

	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public String logout(Model model) {
		return "login";
	}

	@RequestMapping(value="/deniedPage")
	public String deniedPage(Model model) {
		return "denied";
	}
}
