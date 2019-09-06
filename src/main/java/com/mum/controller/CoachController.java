package com.mum.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mum.domain.Coach;
import com.mum.repository.CoachRepository;




@Controller
public class CoachController {
	
	@Autowired //implements IOC
	private CoachRepository coachRepository;
	
////home academy schedule group coach athlete
	 @RequestMapping(value="/coach", method = RequestMethod.GET)
		public ModelAndView coach() {
		 ModelAndView mav = new ModelAndView("coach");
		return mav;
		}
	//Add new Coach
	@RequestMapping(value = "/coach/create", method = RequestMethod.POST)
	@ResponseBody
	public Coach coachCreate(@RequestBody Coach coach) {
		Coach coh = coachRepository.save(coach);
		return coh;
	}
	
	//Display details of existing coaches
	@RequestMapping(value = "/coach/all", method = RequestMethod.GET)
	@ResponseBody
	public List<Coach> coachList() {
		List<Coach> coaches = coachRepository.findAll();
		return coaches;
	}
	
	//Delete specific coach data
	@RequestMapping(value = "/coach/delete", method = RequestMethod.POST)
	@ResponseBody
	public void coachDelete(@RequestBody Coach cid) {
		coachRepository.delete(cid.getCoach_id());
	}
	
	//Update existing coach record
	@RequestMapping(value = "/coach/update", method = RequestMethod.POST)
	@ResponseBody
	public Coach coachUpdate(@RequestBody Coach coach) {
		Coach coh = coachRepository.save(coach); // note that given coach_id must be present
		return coh;
	}
	
}
