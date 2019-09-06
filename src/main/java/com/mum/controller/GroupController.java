package com.mum.controller;

import java.math.BigInteger;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mum.domain.Coach;
import com.mum.domain.Group;
import com.mum.repository.CoachRepository;
import com.mum.repository.GroupRepository;



@Controller
public class GroupController {
	
	@Autowired //implements IOC
	private GroupRepository groupRepository;
	
	@Autowired
	private CoachRepository coachRepository;
	
////home academy schedule group coach athlete
	 @RequestMapping(value="/group", method = RequestMethod.GET)
		public ModelAndView group() {
		 ModelAndView mav = new ModelAndView("group");
		return mav;
		}
	//Add details of new group
	@RequestMapping(value = "/group/addGroup", method = RequestMethod.POST)
	@ResponseBody
	public Group addGroup(@RequestBody Group group) {
		Group persistedGroup = groupRepository.save(group);
		return persistedGroup;
	}
	
	//Display details of existing groups
	@RequestMapping(value = "/group/getGroups", method = RequestMethod.GET)
	@ResponseBody
	public List<Group> getGroups(){
		List<Group> listofgroups = groupRepository.findAll();
		return listofgroups;
	}
	
	//Delete specific group
	@RequestMapping(value = "/group/deleteGroup", method = RequestMethod.POST)
	@ResponseBody
	public List<Group> deleteGroup(@RequestBody Group group) {
		long deleteId = group.getGroupID();
		Group deleteGroup = groupRepository.findByGroupID(deleteId);
		if(deleteGroup != null)
			groupRepository.delete(deleteGroup);
		List<Group> remainingGroup = groupRepository.findAll();
		
		return remainingGroup;
	}
	
	//Returns details of specific group
	@RequestMapping(value = "/group/getAGroup", method = RequestMethod.POST)
	@ResponseBody
	public Group getAGroup(@RequestBody Group group) {
		long groupId = group.getGroupID();
		Group fetchGroup = groupRepository.findByGroupID(groupId);
		return fetchGroup;
	}
	
	//Update details of existing group
	@RequestMapping(value = "/group/updateGroup", method = RequestMethod.POST)
	@ResponseBody
	public List<Group> updateGroup(@RequestBody Group group) {
		long groupId = group.getGroupID();
		Group updatedGroup = groupRepository.findByGroupID(groupId);
		updatedGroup.setGroupDescription(group.getGroupDescription());
		updatedGroup.setGroupName(group.getGroupName());
		updatedGroup.setGroupStatus(group.getGroupStatus());
		groupRepository.save(updatedGroup);
		List<Group> allGroups = groupRepository.findAll();
		return allGroups;
	}
	
	//Add coaches to a group
	@RequestMapping(value = "/group/addCoach", method = RequestMethod.POST)
	@ResponseBody
	public Group addCoach(@RequestBody Group group) {
		Group tg = groupRepository.findByGroupID(group.getGroupID());
		Set<Coach> tc = tg.getCoach();
		tc.addAll(group.getCoach());
		tg.setCoach(tc);
		groupRepository.save(tg);
		return groupRepository.findByGroupID(group.getGroupID());
		
	}

	//Get coaches of a group
	@RequestMapping(value = "/group/allCoachID", method = RequestMethod.GET)
	@ResponseBody
	public List<java.math.BigInteger> getAllCoachID(){
		return coachRepository.getAllCoachID();
	}

	@RequestMapping(value = "/group/testId", method = RequestMethod.GET)
	@ResponseBody
	public BigInteger fetchAid(Long group_id){
		return groupRepository.aid(group_id);
	}

//	@PostMapping("/addCoach")
//	public void addCoach(@RequestBody Coach coach) {
//		CoachGroupData groupCoach;
//		groupCoach.setCoachId(coach.getCoachId());
//		groupCoach.setGroupId(coach.getGroupId());
//		coachGroupRepo.save(groupCoach);
//	}
}
