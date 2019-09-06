package com.mum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mum.domain.Athlete;
import com.mum.repository.AthleteRepository;
import com.mum.repository.CoachRepository;



@Controller

public class AthleteController {
	
	@Autowired //implements IOC
	private AthleteRepository arepo;
	
	@Autowired
	private CoachRepository coachRepo;
	
////home academy schedule group coach athlete
	 @RequestMapping(value="/athlete", method = RequestMethod.GET)
		public ModelAndView athlete() {
		 ModelAndView mav = new ModelAndView("athlete");
		return mav;
		}
	//Display data of existing athletes
	@RequestMapping(value = "/athlete/getallAthlete", method = RequestMethod.GET)
	@ResponseBody
	public List<Athlete> AthleteList()
	{
	
		List<Athlete> a1=arepo.findAll();
		return a1;
	
	}
	
	//Add new athlete data
	@RequestMapping(value = "/athlete/addAthlete", method = RequestMethod.POST)
	@ResponseBody
	public Athlete AthleteAdd(@RequestBody Athlete Athlete)
	{
		
		arepo.saveAndFlush(Athlete);
		
		return Athlete;
	}
	
	//Delete specific athlete
	@RequestMapping(value = "/athlete/deleteAthlete", method = RequestMethod.POST)
	@ResponseBody
	public Athlete AthleteDelete(@RequestBody Athlete athlete)
	{
		arepo.deleteAth(athlete.getId());
		return athlete;
	}
	
	//Update records of existing athlete
	@RequestMapping(value = "/athlete/AthleteUpdate", method = RequestMethod.POST)
	@ResponseBody
	 public Athlete AthleteUpdate(@RequestBody Athlete Athlete)
	 {
		 return Athlete;
		 
	 }
	
	//Get details of athlete by his/her name
	@RequestMapping(value = "/athlete/AthleteByName/{name}", method = RequestMethod.GET)
	@ResponseBody
    public Athlete getAthleteByName(@PathVariable(value ="name" ) String name){
	    return arepo.findByFirstName(name);
     }
	 
	//Display Coach by Group ID
	@RequestMapping(value = "/athlete/coachByGroupID", method = RequestMethod.GET)
	@ResponseBody
	 public List<java.math.BigInteger> getCoachID(@RequestParam Long group_id){
		 return coachRepo.getAllCoachIDByGroupID(group_id);
	 }
	
	//Display athlete by athlete ID
	@RequestMapping(value = "/athlete/athleteByID", method = RequestMethod.GET)
	@ResponseBody
	 public Athlete getByID(@RequestParam Long id) {
		 return arepo.findAth(id);
	 }
	 

}
