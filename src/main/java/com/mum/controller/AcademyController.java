package com.mum.controller;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mum.domain.Academy;
import com.mum.repository.AcademyRepository;
import com.mum.repository.AthleteRepository;
import com.mum.repository.CoachRepository;
import com.mum.repository.GroupRepository;



@Controller

public class AcademyController {
	
	@Autowired
	private AcademyRepository academyRepository;
	
	@Autowired
	private CoachRepository coachRepository;
	
	@Autowired
	private GroupRepository groupRepository;
	
	@Autowired
	private AthleteRepository athleteRepository;
////home academy schedule group coach athlete
	 @RequestMapping(value="/academy", method = RequestMethod.GET)
		public ModelAndView academy() {
		 ModelAndView mav = new ModelAndView("academy");
		return mav;
		}
	 
	@RequestMapping(value = "/academy/add", method = RequestMethod.POST)
	@ResponseBody
	public Academy addAcademy(@RequestBody Academy academy) {
		return academyRepository.save(academy);
	}
	@RequestMapping(value = "/academy/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Academy> getAll() {
		return academyRepository.findAll();
	}
	@RequestMapping(value = "/academy/delete", method = RequestMethod.POST)
	@ResponseBody
	public void deleteAcademy(@RequestBody Academy academy) {

		Long aid = academy.getId();
		athleteRepository.deleteAth(aid);
		List<java.math.BigInteger> g_id = groupRepository.getAllID(aid);
		List<BigInteger> c_id = new ArrayList<BigInteger>();
		for(BigInteger i : g_id) {
			System.out.println(i);
			c_id.addAll((coachRepository.getAllCoachIDByGroupID(i.longValue())));
		}
		System.out.println("Out of loop");
		coachRepository.deleteJoinData(g_id);
		coachRepository.deleteCoach(c_id);
		groupRepository.deleteGrp(g_id);
		
	}
	@RequestMapping(value = "/academy/update", method = RequestMethod.POST)
	@ResponseBody
	public List<Academy> updateAcademy(@RequestBody Academy academy) {
		Academy d ;
		d=academyRepository.findByName(academy.getName());
		academyRepository.delete(d);
		academyRepository.save(academy);
		List <Academy> list_of_academies = academyRepository.findAll();
		return list_of_academies;
		
		
	}

}
