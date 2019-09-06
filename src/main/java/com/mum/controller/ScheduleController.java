package com.mum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mum.domain.Schedule;
import com.mum.repository.AcademyRepository;
import com.mum.repository.GroupRepository;
import com.mum.repository.ScheduleRepository;




@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleRepository scheduleRepository;
	
	@Autowired
	private AcademyRepository academyController;
	
	@Autowired
	private GroupRepository groupRepository;
	
////home academy schedule group coach athlete
	 @RequestMapping(value="/schedule", method = RequestMethod.GET)
		public ModelAndView schedule() {
		 ModelAndView mav = new ModelAndView("schedule");
		return mav;
		}
	@RequestMapping(value = "/schedule/add", method = RequestMethod.POST)
	@ResponseBody
	public Schedule addSchedule(@RequestBody Schedule schedule) {
		Schedule persistedSchedule = scheduleRepository.save(schedule); 
		// line above saves the object in database
		// and returns same schedule object with id value updated as in DB  
		return persistedSchedule;
	}
	@RequestMapping(value = "/schedule/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Schedule> getAll() {
		List <Schedule> list_of_schedules = scheduleRepository.findAll();
		return list_of_schedules;
	}
	@RequestMapping(value = "/schedule/getAcademyID", method = RequestMethod.GET)
	@ResponseBody
	public List<java.math.BigInteger> getAllAcademyID(){
		return academyController.getAllAcademyID();
	}

	@RequestMapping(value = "/schedule/getGroupID", method = RequestMethod.GET)
	@ResponseBody
	public List<java.math.BigInteger> getAllGroupID(@RequestParam Long id){
		return groupRepository.getAllID(id);
	}
	
	@RequestMapping(value = "/schedule/delete", method = RequestMethod.POST)
	@ResponseBody
	public void deleteSchedule(@RequestBody Schedule sh) {
		scheduleRepository.delete(sh.getId());
	}
}
